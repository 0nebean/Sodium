<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head th:replace="public/head :: onLoadHead(机构管理)">
</head>
<body ddata-type="widgets">

<div class="am-g tpl-g">
    <!-- 模态提示组件 -->
    <div th:include="public/tips :: Tips"></div>
    <!-- 内容区域 -->
    <div class="tpl-content-wrapper">
        <div class="row-content am-cf">
            <div class="row">
                <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                    <div class="row">
                        <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                            <div class="widget am-cf">
                                <div class="widget-head am-cf">
                                    <th:block th:include="public/breadCrumbs :: breadCrumbsTempl"/>
                                </div>
                                <div class="widget-body am-fr">

                                    <form class="am-form tpl-form-border-form tpl-form-border-br" id="DataFrom">
                                        <input type="hidden" name="id" th:value="${r"${identity.id"}">
                                        <input type="hidden" name="isRoot" th:value="${r"${entity.isRoot"}">

                                        <div class="am-form-group">
                                            <label for="orgName" class="am-u-sm-3 am-form-label">上级机构 <span class="tpl-form-line-small-title">Tree</span></label>
                                            <div class="am-u-sm-9"  th:with="pid=(${r"${entity.parentId"} != null or ${r"${entity.isRoot"} == 1)?${r"${entity.parentId"}:1">
                                                <input type="hidden" class="treeValue" name="parentId" id="parentId" th:value="${r"${pid"}">
                                                <tree:org  th:attr="disabled=(${r"${view"} or ${r"${identity.id"} == 1 or ${r"${entity.isRoot"} == 1),pid=${r"${pid"},selfId=${r"${identity.id"},businessInPutId='parentId'"  th:unless="${r"${add"}"/>
                                                <tree:org th:attr="pid=${r"${pid"},businessInPutId='parentId'" th:if="${r"${add"}"/>
                                                <small th:unless="${r"${view"}">从机构树上选择一个机构作为父级</small>
                                            </div>
                                        </div>

                                        <div class="am-form-group">
                                            <label for="orgName" class="am-u-sm-3 am-form-label">机构名 <span class="tpl-form-line-small-title">Text</span></label>
                                            <div class="am-u-sm-9">
                                                <input type="text" class="tpl-form-input" name="orgName" id="orgName" placeholder="请输入机构名" th:disabled="${r"${view"}" th:value="${r"${entity.name"}">
                                                <small th:unless="${r"${view"}">机构名,可包含汉字英文</small>
                                            </div>
                                        </div>

                                        <div class="am-form-group">
                                            <label for="sort" class="am-u-sm-3 am-form-label">排序字段 <span class="tpl-form-line-small-title">Number</span></label>
                                            <div class="am-u-sm-9">
                                                <input type="number" class="tpl-form-input" name="sort" id="sort" placeholder="请输入机构排序字段" th:disabled="${r"${view"}" th:value="${r"${entity.sort"}">
                                                <small th:unless="${r"${view"}">只限数字</small>
                                            </div>
                                        </div>

                                        <div class="am-form-group">
                                            <label for="remark" class="am-u-sm-3 am-form-label">备注 <span class="tpl-form-line-small-title">Text</span></label>
                                            <div class="am-u-sm-9">
                                                <textarea class="" rows="10" id="remark" name="remark" placeholder="请输入备注"  th:disabled="${r"${view"}" th:text="${r"${entity.remark"}"></textarea>
                                            </div>
                                        </div>

                                        <div class="am-form-group">
                                            <div class="am-u-sm-9 am-u-sm-push-3">
                                                <th:block sec:authorize="hasPermission('$everyone','PERM_ORG_SAVE')">
                                                    <button type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success" th:unless="${r"${view"}">提交</button>
                                                </th:block>

                                                <th:block sec:authorize="hasPermission('$everyone','PERM_ORG_EDIT')">
                                                    <button type="button" class="am-btn am-btn-warning" th:onclick="'routingPage(\'/${mapping}/edit/'+${r"${identity.id"}+'\')'" th:if="${r"${view"}">编辑</button>
                                                </th:block>

                                                <button type="button" class="am-btn am-btn-danger" onClick="routingPage('/${mapping}/preview/')">返回</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>

<css th:replace="public/css :: onLoadCSS"></css>
<js th:replace="public/js :: onLoadJS"></js>
<script th:inline="javascript">
    $(function () {
        validateFrom();
    });

    /**
     * 校验登录表单
     * @returns void
     */
    function validateFrom(){
        $("#DataFrom").validate({
            rules: {
                orgTree:{
                    treeRequired:true
                },
                orgName:{
                    required:true,
                    maxlength:50
                },
                sort:{
                    required:true,
                    positiveNumber:true,
                    number:true
                },
                remark:{
                    maxlength:255
                }

            },
            submitHandler: function(form) { //验证成功时调用
                var param = $('#DataFrom').serializeJson();
                var url = "/${mapping}/save";
                var completeHandler = function (data) {
                    routingPage('/${mapping}/preview/');
                };
                doPost(url,param,completeHandler)
            }
        });
    }

</script>
</body>
</html>