<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        <link href="https://fonts.googleapis.com/css?family=Muli" rel="stylesheet"/>
        <link href="${url.resourcesPath}/img/favicon.png" rel="icon"/>
        <script>
            function togglePassword() {
                var x = document.getElementById("password");
                var v = document.getElementById("vi");
                if (x.type === "password") {
                    x.type = "text";
                    v.src = "${url.resourcesPath}/img/eye.png";
                } else {
                    x.type = "password";
                    v.src = "${url.resourcesPath}/img/eye-off.png";
                }
            }
        </script>
    <#elseif section = "form">
        <div>
            <img class="logo" src="${url.resourcesPath}/img/image.png" alt="My Auth">
        </div>
        <div class="box-container">
            <!--<div>
                <p class="application-name">Custom Identity Service</p>
            </div>-->
        <#if realm.password>
            <div>
               <form id="kc-form-login" class="form" onsubmit="return true;" action="${url.loginAction}" method="post">
                    <input id="username" class="login-field" placeholder="${msg("username")}" type="text" name="username" tabindex="1">
                    <div>
                        <label class="visibility" id="v" onclick="togglePassword()"><img id="vi" src="${url.resourcesPath}/img/eye-off.png"></label>
                    </div>
                <input id="password" class="login-field" placeholder="${msg("password")}" type="password" name="password" tabindex="2">
                <input class="submit" type="submit" value="${msg("doLogIn")}" tabindex="3">
				<div>
					<p class="copyright">&copy; ${msg("copyright", "${.now?string('yyyy')}")}</p>
				</div>
                </form>
            </div>
        </#if>
        <#if social.providers??>
			<div class="alternate-wrapper">
				<span spacing="16" class="separator"></span>
				<div class="login-alternate-spacer"></div>
				<span data-cy="text" font-size="16px" font-weight="400" class="login-alternate">or</span>
				<div class="login-alternate-spacer"></div>
				<span spacing="16" class="separator"></span>
			</div>
            <!--<p class="para">${msg("socialLoginAlternate")}</p>-->
            <div id="social-providers">
                <#list social.providers as p>
                <input class="social-link-style" type="button" onclick="location.href='${p.loginUrl}';" value="${p.displayName}"/>
                </#list>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
