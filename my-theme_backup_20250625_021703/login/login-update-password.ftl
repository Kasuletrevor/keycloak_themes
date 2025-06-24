<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <div>
            <img class="logo" src="${url.resourcesPath}/img/image.png" alt="EmergentAI">
        </div>
        <form id="kc-passwd-update-form" class="form" action="${url.loginAction}" method="post">
            <input type="text" id="username" name="username" value="${username}" autocomplete="username" readonly="readonly" style="display:none;"/>
            
            <div>
                <div class="visibility" id="v" onclick="togglePasswordNew()">
                    <img id="vi-new" src="${url.resourcesPath}/img/eye-off.png">
                </div>
                <input type="password" id="password-new" class="login-field" name="password-new" placeholder="${msg("passwordNew")}" autofocus autocomplete="new-password" />
            </div>
            
            <div>
                <div class="visibility" id="v-confirm" onclick="togglePasswordConfirm()">
                    <img id="vi-confirm" src="${url.resourcesPath}/img/eye-off.png">
                </div>
                <input type="password" id="password-confirm" class="login-field" name="password-confirm" placeholder="${msg("passwordConfirm")}" autocomplete="new-password" />
            </div>
            
            <input class="submit" type="submit" value="${msg("doSubmit")}" />
            
            <div>
                <p class="copyright">&copy; ${msg("copyright", "${.now?string('yyyy')}")}</p>
            </div>
            
            <script>
                function togglePasswordNew() {
                    var x = document.getElementById("password-new");
                    var v = document.getElementById("vi-new");
                    if (x.type === "password") {
                        x.type = "text";
                        v.src = "${url.resourcesPath}/img/eye.png";
                    } else {
                        x.type = "password";
                        v.src = "${url.resourcesPath}/img/eye-off.png";
                    }
                }
                
                function togglePasswordConfirm() {
                    var x = document.getElementById("password-confirm");
                    var v = document.getElementById("vi-confirm");
                    if (x.type === "password") {
                        x.type = "text";
                        v.src = "${url.resourcesPath}/img/eye.png";
                    } else {
                        x.type = "password";
                        v.src = "${url.resourcesPath}/img/eye-off.png";
                    }
                }
            </script>
        </form>
    </#if>
</@layout.registrationLayout>
