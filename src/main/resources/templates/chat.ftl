<#import "freemarkerTemplates/page.ftl" as p>
<#include "freemarkerTemplates/security.ftl">

<@p.page "Chat">
    <h1>Welcome to my chat! :3</h1>
    <#if !user_now.isBlocked()>
        <a class="btn btn-primary my-4" data-toggle="collapse" href="#msg" role="button" aria-expanded="false"
           aria-controls="msg">
            New message
        </a>
        <div class="collapse my-2" , id="msg">
            <div class="form-group">
                <form method="post" action="/chat">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <input type="text" placeholder="Your message" name="userMsg" class="form-control my-1"/>
                    <button type="submit" class="btn btn-primary mt-2">Send</button>
                </form>
            </div>
        </div>
    <#else>
        <div class="my-3">
            Sorry, you are banned from chat @-@
        </div>
    </#if>

    <!-- MESSAGE LOG -->
    <h3>Message log</h3>
    <#list messages as msg>
        <div class="card my-3 w-50">
            <div class="card-body">
                <p class="card-text">${msg.text}</p>

                <!-- Delete message -->
                <#if isMod || isAdmin>
                    <form method="post" action="/delete_msg">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <input type="hidden" name="msg_id" value="${msg.id}"/>
                        <button type="submit" class="btn btn-primary">Delete</button>
                    </form>
                </#if>
            </div>
            <div class="card-footer text-muted text-center">
                ${msg.author.getUsername()} <#if msg.time_published??>${msg.time_published}<#else>${CRUTCH}</#if>
            </div>
        </div>
    <#else>
        No messages in chat :(
    </#list>
</@p.page>