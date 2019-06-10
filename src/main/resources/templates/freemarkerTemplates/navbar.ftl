<#include "security.ftl">

<nav class="navbar navbar-expand-lg navbar-light bg-danger mb-3">
    <a class="navbar-brand" href="/">Chat</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link text-info" href="/login">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-info" href="/chat">Chat</a>
            </li>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link text-info" href="/users">User list</a>
                </li>
            </#if>
        </ul>

        <div class="navbar-text mr-3 text-info">
            ${name}
        </div>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-primary">Sign out</button>
        </form>
    </div>
</nav>