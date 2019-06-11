<#macro login action button text access>
    <div class="my-2">
        <#if error??>${error}<#else>${text}</#if>
    </div>
    <form action="${action}" method="post">
        <!-- Username field -->
        <div class="form-group">
            <label for="username">
                <#if access>Current username: ${username}<#else>User Name:</#if>
            </label>
            <input type="text" name="username" class="form-control" placeholder="Enter username"/>
        </div>

        <!-- Password field -->
        <div class="form-group">
            <label for="password">
                <#if access>Current password: ${password}<#else>Password:</#if>
            </label>
            <input type="password" name="password" class="form-control" placeholder="Enter password"/>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>

        <!-- Button field -->
        <div>
            <button type="submit" class="btn btn-primary mb-2">${button}</button>
        </div>
    </form>
</#macro>