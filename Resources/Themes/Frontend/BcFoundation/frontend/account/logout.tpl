{extends file='parent:frontend/account/logout.tpl'}

{namespace name='frontend/account/ajax_logout'}

{block name="frontend_account_logout_info"}
	<div class="panel has--border account-logout--panel">

		{block name="frontend_account_logout_info_headline"}
			<h1 class="panel--title is--underline">{s name="AccountLogoutHeader"}{/s}</h1>
		{/block}

		{block name="frontend_account_logout_info_content"}
			<div class="panel--body is--wide">
				<p class="logout--text">{s name="AccountLogoutText"}{/s}</p>
			</div>
		{/block}

		{block name="frontend_account_logout_info_actions"}
			<div class="panel--actions panel--footer">
				<ul class="nav account--panel-nav">
					<li class="nav-item account--panel-nav-item">
						<a class="btn is--secondary account--panel-nav-action" href="{url controller='index'}" title="{"{s name='AccountLogoutButton'}{/s}"|escape}">
							<i class="icon--arrow-left"></i>
							<span class="text-node">{s name="AccountLogoutButton"}{/s}</span>
						</a>
					</li>
					<li class="nav-item account--panel-nav-item">
						<a class="btn is--primary account--panel-nav-action" href="{url controller='account'}" title="{"{s name='AccountLogoutAccountButton'}{/s}"|escape}">
							<i class="icon--key"></i>
							<span class="text-node">{s name="AccountLogoutAccountButton"}{/s}</span>
						</a>
					</li>
				</ul>
			</div>
		{/block}
	</div>
{/block}