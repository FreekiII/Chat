<#include "security.ftl">

<nav class="navbar navbar-expand-lg navbar-light bg-info mb-3">
    <!-- Main page -->
    <a class="navbar-brand text-dark" href="/" style="font-weight: bold">Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <!-- Login -->
            <#if !user??>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="/login">Login</a>
                </li>
            </#if>

            <!-- Chat -->
            <li class="nav-item">
                <a class="nav-link text-dark" href="/chat">Chat</a>
            </li>

            <!-- User list -->
            <#if isAdmin || isMod?ifExists>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="/users">User list</a>
                </li>
            </#if>
        </ul>

        <#if user??>
            <!-- Profile -->
            <div class="navbar-text mr-3 text-dark">
                <a href="/profile">
                    ${name}
                </a>
            </div>

            <!-- Logout -->
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-primary">Sign out</button>
            </form>
        </#if>
    </div>
</nav>