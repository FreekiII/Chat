<#import "freemarkerTemplates/page.ftl" as p>
<#import "freemarkerTemplates/loginForm.ftl" as l>

<@p.page "Registration">
    <@l.login "/registration" "Register" "Fill up your credentials"/>
    <a href="/login">Already have an account</a>
</@p.page>