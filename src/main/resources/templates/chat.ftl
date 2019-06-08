<#import "freemarkerTemplates/page.ftl" as p>

<@p.page "Chat">
    <div>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit">Sign out</button>
        </form>
    </div>
    <h1>Welcome to my chat! :3</h1>
    <div>
        <form method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <input type="text" placeholder="Your message" name="userMsg"/>
            <button type="submit">Send</button>
        </form>
    </div>
    <h3>Message log</h3>
    <#list messages as msg>
        <div>${msg.author.getUsername()}</div>
        <div>${msg.text}</div>
    <#else>
        No messages in chat :(
    </#list>
</@p.page>