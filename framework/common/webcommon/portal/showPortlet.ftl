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

<#if portlet?has_content>
<table width="100%">
  <tr><td>
    <div>
      <@render resource=portlet.screenLocation name=portlet.screenName reqAttribs={"portalPortletId":portlet.portalPortletId}/>
    </div>
  </td></tr>
</table>
<#else>
<h2>Portlet '${parameters.portalPortletId!}' not found. You may not have the necessary seed or other data for it.</h2>
</#if>
