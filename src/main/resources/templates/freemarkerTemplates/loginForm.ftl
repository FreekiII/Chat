<#macro login action button text>
    <div class="my-2">
        <#if error??>${error}<#else>${text}</#if>
    </div>
    <form action="@{action}" method="post">
        <div class="form-group">
            <label for="username">
                User Name:
            </label>
            <input type="text" name="username" class="form-control" placeholder="Enter username"/>
        </div>
        <div class="form-group">
            <label for="password">
                Password:
            </label>
            <input type="password" name="password" class="form-control" placeholder="Enter password"/>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div>
            <button type="submit" class="btn btn-primary mb-2">${button}</button>
        </div>
    </form>
</#macro>