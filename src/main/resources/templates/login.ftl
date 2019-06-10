<#import "freemarkerTemplates/page.ftl" as p>
<#import "freemarkerTemplates/loginForm.ftl" as l>

<@p.page "Login">
    <@l.login "/login" "Sign in" "Please sign in"/>
    <a href="/registration">Create account</a>
</@p.page>