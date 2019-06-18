<#import "freemarkerTemplates/page.ftl" as p>
<#import "freemarkerTemplates/loginForm.ftl" as l>

<@p.page "Profile">
    <@l.login "/profile" "Change" "Your profile page" true/>
</@p.page>