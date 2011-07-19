<#if hasError>
	<div class="errors"><fmt:message key="statement.erro" /></div>
</#if>
<h2 class="pagetitle"><fmt:message key="statement" /></h2>
<div style="float:left" class="formulario">
	<form id="frmStatement" action='' method="post" >
		<div style="float:left; padding: 3px;margin: 2px;" >
			<label class="strong">Name</label>: &nbsp;
			<input id="assuntoStmt" type="text" name="statement.name" value="${statement.name}"/><br/><br/>
			<label class="strong">Password</label>: &nbsp;
			<input id="passwordStmt" type="password" name="statement.password" value="${statement.password}"/><br/><br/>
			<textarea id="hqlToExecute" rows="10" cols="10" name="statement.hql">${statement.hql}</textarea>
		</div>

		<div style="padding-top:3px; clear:left">
			<input type="submit" value="Create" />
		</div>

	</form>
</div>

<br/>
<fieldset style="padding: 4px; float:left; width:100%" class="fieldsetChique">
	<legend id="meusStmts" style="cursor: pointer">All statements</legend>
	<table id="statements" class="tabela" >
		<thead>
			<tr class="even">
				<th>Name</th>
				<th>Password protected?</th>
				<th>Hql</th>
				<th/>

			</tr>
		</thead>
		

		<tbody>
			<#assign count = 0>
			<#list statements as stmt>
				<#assign count = count + 1>
				<tr id="trStatement_${stmt.id}" class="${ count % 2 == 0 ? 'even' : 'odd'}">
					<td>
						<a id="tituloStmt_${stmt.id}" href="${stmt.id}">${stmt.titulo}</a>
					</td>
					<td id=">${stmt.passwordProtected}</td>
					<td id="corpoStmt_${stmt.id}">${stmt.hql}</td>
					<td>
						<a href="" onclick="alert('todo: support to remove, just link and do a method DELETE on it');" id="remove_${stmt.id}">remove</a>
					</td>

				</tr>
			</#list>
		</tbody>
	</table>
</fieldset>
<br/>