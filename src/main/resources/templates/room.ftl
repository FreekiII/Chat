<#import "freemarkerTemplates/page.ftl" as p>

<@p.page "${room.name}">
    <h2>Welcome to room ${room.name} :3</h2>

    <!-- Add user -->
    <#if !user_now.isBlocked() && (!room.is_private() || room.is_private() && room.isUserListEmpty())>
        <div class="col-4">
            <a class="btn btn-primary my-4" data-toggle="collapse" href="#add" role="button" aria-expanded="false"
               aria-controls="add">
                Add user
            </a>
        </div>
        <div class="collapse my-2" , id="add">
            <div class="form-group">
                <form method="post" action="/room/${room.id}/add_user">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <label for="selectUser">Select user</label>
                    <select id="selectUser" name="username">
                        <#list all_users as user>
                            <option selected>${user.username}</option>
                        </#list>
                    </select>
                    <button type="submit" class="btn btn-primary mt-2">Add user</button>
                </form>
            </div>
        </div>
    </#if>

    <!-- Delete user -->
    <#if (user_now.id == room.owner.id || user_now.isAdmin()) && !room.isUserListEmpty()>
        <div class="col-4">
            <a class="btn btn-primary my-4" data-toggle="collapse" href="#delete" role="button" aria-expanded="false"
               aria-controls="delete">
                Delete user
            </a>
        </div>
        <div class="collapse my-2" , id="delete">
            <div class="form-group">
                <form method="post" action="/room/${room.id}/delete_user">
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <label for="selectUser">Select user</label>
                    <select id="selectUser" name="username">
                        <#list room.user_list as user>
                            <option selected>${user.username}</option>
                        </#list>
                    </select>
                    <button type="submit" class="btn btn-primary mt-2">Delete user</button>
                </form>
            </div>
        </div>
    </#if>

    <!-- Rename room -->
    <#if user_now.id == room.owner.id || user_now.isAdmin()>
        <form method="post" action="/room/${room.id}/rename">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <label for="rename">Choose new name</label>
            <input type="text" id="rename" name="new_name" placeholder="${room.name}"/>
            <button type="submit" class="btn btn-primary mt-2">Rename</button>
        </form>
    </#if>

    <!-- Delete room -->
    <#if user_now.id == room.owner.id || user_now.isAdmin()>
        <form method="post" action="/room/${room.id}/delete">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-primary mt-2">Delete</button>
        </form>
    </#if>

    <!-- New message -->
    <#if !user_now.isBlocked()>
        <div class="col-4">
            <a class="btn btn-primary my-4" data-toggle="collapse" href="#msg" role="button" aria-expanded="false"
               aria-controls="msg">
                New message
            </a>
        </div>
        <div class="collapse my-2" , id="msg">
            <div class="form-group">
                <form method="post" action="/room/${room.id}">
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

    <!-- Container for information -->
    <div class="container">
        <div class="row">
            <!-- MESSAGE LOG -->
            <div class="col-8">
                <h3>Message log</h3>
                <#list messages as msg>
                    <div class="card my-3 w-60">
                        <div class="card-body">
                            <p class="card-text">${msg.text}</p>

                            <!-- Delete message -->
                            <#if user_now.isModerator() || user_now.isAdmin()>
                                <form method="post" action="/room/${room.id}/delete_msg">
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
            </div>

            <!-- USERS OF THIS ROOM -->
            <div class="col-4">
                <h3>Chatters</h3>

                <!-- OWNER -->
                <div class="card my-3 w-40">
                    <div class="card-body">
                        <p class="card-text">${room.owner.username}</p>
                    </div>
                    <div class="card-footer text-muted text-center">
                        Owner of this room
                    </div>
                </div>

                <!-- OTHERS -->
                <#list user_list as user>
                    <div class="card my-3 w-40">
                        <div class="card-body">
                            <p class="card-text">${user.username}</p>
                        </div>
                        <div class="card-footer text-muted text-center">
                            User
                        </div>
                    </div>
                <#else>
                    No users other than owner :(
                </#list>
            </div>
        </div>
    </div>
</@p.page>