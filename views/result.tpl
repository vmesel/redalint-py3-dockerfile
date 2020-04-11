%import shlex, unicodedata
    <div class="search-result">
    %number = (query['page'] - 1)*config['perpage'] + i + 1
    <div class="search-result-number"><a href="#r{{d['sha']}}">#{{number}}</a></div>
    %url = d['url'].replace('file://', '')
    %for dr, prefix in config['mounts'].items():
        %url = url.replace(dr, prefix)
    %end
    <div class="search-result-title" id="r{{d['sha']}}" title="{{d['abstract']}}"><a href="{{url}}">{{d['label']}}</a></div>
    <p>{{d['extra_metadata']}}</p>
    %if len(d['ipath']) > 0:
        <div class="search-result-ipath">[{{d['ipath']}}]</div>
    %end
    %if  len(d['author']) > 0:
        <div class="search-result-author">{{d['author']}}</div>
    %end
    <div class="search-result-url">
        %urllabel = d['url'].replace('/'+d['filename'],'').replace('file://','')
        %for r in config['dirs']:
            %urllabel = urllabel.replace(r.rsplit('/',1)[0] + '/' , '')
        %end
        <a href="{{url.replace('/'+d['filename'],'')}}">{{urllabel}}</a>
    </div>
    <div class="search-result-date">{{d['time']}}</div>
    %for q in shlex.split(query['query'].replace("'","\\'")):
        %if not q == "OR":
            % w = q.lower()
            % d['snippet'] = d['snippet'].replace(w,'<span class="search-result-highlight">'+w+'</span>')
        %end
    %end
    <div class="search-result-snippet">{{!d['snippet']}}</div>
</div>
<!-- vim: fdm=marker:tw=80:ts=4:sw=4:sts=4:et:ai
-->
