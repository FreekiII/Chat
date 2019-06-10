<#import "freemarkerTemplates/page.ftl" as p>

<@p.page "Chat">
    <h1>Welcome to my chat! :3</h1>
    <a class="btn btn-primary my-4" data-toggle="collapse" href="#msg" role="button" aria-expanded="false"
       aria-controls="msg">
        New message
    </a>
    <div class="collapse my-2" , id="msg">
        <div class="form-group">
            <form method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="text" placeholder="Your message" name="userMsg" class="from-control my-1"/>
                <button type="submit" class="btn btn-primary">Send</button>
            </form>
        </div>
    </div>
    <h3>Message log</h3>
    <#list messages as msg>
        <div class="card my-3" style="width: 25rem;">
            <div class="form-control form-control-lg">   ${msg.text}</div>
            <div class="card-footer text-muted">
                ${msg.author.getUsername()}
            </div>
        </div>
    <#else>
        No messages in chat :(
    </#list>
</@p.page>