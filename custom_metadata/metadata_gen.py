import gspread
import json
from unicodedata import normalize

from pprint import pprint
from oauth2client.service_account import ServiceAccountCredentials

def download_extra_metadata():
    scope = ['https://spreadsheets.google.com/feeds',
            'https://www.googleapis.com/auth/drive']

    creds = ServiceAccountCredentials.from_json_keyfile_name('/redalint/client_secret.json', scope)
    client = gspread.authorize(creds)

    sheet = client.open("teste-redalint").sheet1

    list_of_hashes = sheet.get_all_records()

    for idx, hash_ in enumerate(list_of_hashes, start=0):
        list_of_hashes[idx] = {
            normalize('NFKD', str(k)): normalize('NFKD', str(v))
            for k, v in hash_.items()
        }

    middle_json = {dict_result["nome_arquivo"]: dict_result for dict_result in list_of_hashes}

    f = open("/redalint/metadados.json", "w")
    json.dump(middle_json, f, indent=4, sort_keys=True, ensure_ascii=False)
    f.close()
    return True

if __name__ == "__main__":
    download_extra_metadata()