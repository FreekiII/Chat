<#import "freemarkerTemplates/page.ftl" as p>

<@p.page "Chat">
    <h1>Welcome to my chat! :3</h1>
    <!-- New chat room -->
    <div class="col-4">
        <a class="btn btn-primary my-4" data-toggle="collapse" href="#room" role="button" aria-expanded="false"
           aria-controls="room">
            New room
        </a>
    </div>
    <div class="collapse my-2" , id="room">
        <div class="form-group">
            <form method="post" action="/create_room">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="text" placeholder="Name of chat room" name="room_name" class="form-control my-1"/>
                <label>
                    <input type="checkbox" name="is_private"/>
                    Private
                </label>
                <button type="submit" class="btn btn-primary mt-2">Create</button>
            </form>
        </div>
    </div>

    <!-- Chat rooms -->
    <h3>Available rooms: </h3>
    <#list rooms as room>
        <#if user_now.isAdmin() || user_now.id == room.owner.id>
            <form method="get" action="/room/${room.id}">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-primary mt-2 bg-danger">${room.name}</button>
            </form>
        </#if>
    <#else>
        No rooms available :(
    </#list>
</@p.page>