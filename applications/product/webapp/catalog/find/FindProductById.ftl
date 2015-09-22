<#--
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
-->

<@section title="${uiLabelMap.ProductFindProductWithIdValue}">
        <form name="idsearchform" method="post" action="<@ofbizUrl>FindProductById</@ofbizUrl>">
          <span>${uiLabelMap.CommonId} ${uiLabelMap.CommonValue}:</span> <input type="text" name="idValue" size="20" maxlength="50" value="${idValue!}" />&nbsp;<a href="javascript:document.idsearchform.submit()" class="${styles.button_default!}">${uiLabelMap.CommonFind}</a>
        </form>
        
        <p>${uiLabelMap.ProductSearchResultsWithIdValue}: ${idValue!}</p>
        <#if !goodIdentifications?has_content && !idProduct?has_content>
          <@resultMsg>${uiLabelMap.ProductNoResultsFound}.</@resultMsg>
        <#else>
          <@table type="data-list" autoAltRows=true cellspacing="0" class="basic-table">
            <#if idProduct?has_content>
            <@tr valign="middle">
                <@td>
                    ${idProduct.productId}
                </@td>
                <@td>&nbsp;&nbsp;</@td>
                <@td>
                    <a href="<@ofbizUrl>EditProduct?productId=${idProduct.productId}</@ofbizUrl>" class="${styles.button_default!}">${(idProduct.internalName)!}</a>
                    (${uiLabelMap.ProductSearchResultsFound})
                </@td>
            </@tr>
            </#if>
            <#list goodIdentifications as goodIdentification>
                <#assign product = goodIdentification.getRelatedOne("Product", true)/>
                <#assign goodIdentificationType = goodIdentification.getRelatedOne("GoodIdentificationType", true)/>
                <@tr valign="middle">
                    <@td>
                        ${product.productId}
                    </@td>
                    <@td>&nbsp;&nbsp;</@td>
                    <@td>
                        <a href="<@ofbizUrl>EditProduct?productId=${product.productId}</@ofbizUrl>" class="${styles.button_default!}">${(product.internalName)!}</a>
                        (${uiLabelMap.ProductSearchResultsFound} ${goodIdentificationType.get("description",locale)?default(goodIdentification.goodIdentificationTypeId)}.)
                    </@td>
                </@tr>
            </#list>
          </@table>
        </#if>
</@section>
