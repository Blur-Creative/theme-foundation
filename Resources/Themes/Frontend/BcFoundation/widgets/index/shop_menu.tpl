{extends file="parent:widgets/index/shop_menu.tpl"}

{* Language switcher *}
{block name='frontend_index_actions_active_shop'}
    {if $shop && $languages|count > 1}
        <div class="top-bar--language">
            {block name='frontend_index_actions_active_shop_top_bar_language'}
                {if $languages|count > 1}
                    
					{block name="frontend_index_actions_active_shop_language_form_content"}
						<div class="has--drop-down" aria-haspopup="true" data-drop-down-menu="true">
							<button class="btn language-dropdown-btn dropdown--menu-button" type="button" id="language-dropdown-button">
								<span class="language--flag {$shop->getLocale()->toString()}"></span>
								<span class="text-node">Sprache</span>
							</button>
							{block name="frontend_index_actions_active_shop_language_form_select"}
								<div class="dropdown--menu" aria-labelledby="language-dropdown-button">
									<form method="post" class="language--form">
										<ul class="dropdown--menu-list no--space">
											{foreach $languages as $language}
												<li class="dropdown--menu-item">
													<button type="submit" class="dropdown--menu-link {if $language->getId() === $shop->getId()} active{/if}" name="__shop" value="{$language->getId()}">
														{$language->getName()}
													</button>
												</li>
											{/foreach}
										</ul>
										<input type="hidden" name="__redirect" value="1">
									</form>
								</div>
							{/block}
							
							{block name="frontend_index_actions_active_shop_inline"}{/block}
						</div>
					{/block}
                {/if}
            {/block}
        </div>
    {/if}
{/block}

{* Currency changer *}
{block name='frontend_index_actions_currency'}
    {if $currencies|count > 1}
        <div class="btn-group top-bar--currency">
            {block name='frontend_index_actions_currency_form'}
				{block name="frontend_index_actions_currency_form_content"}	
					<button class="btn currency-dropdown-btn dropdown-toggle" type="button" id="currency-dropdown-button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						Währung
					</button>
					{block name="frontend_index_actions_currency_form_select"}
						<div class="dropdown-menu" aria-labelledby="currency-dropdown-button">
							<form method="post" class="currency--form">
								{foreach $currencies as $currency}
									<button type="submit" class="dropdown-item{if $currency->getId() === $shop->getCurrency()->getId()} active{/if}" name="__currency" value="{$currency->getId()}">
										{if $currency->getSymbol() != $currency->getCurrency()}{$currency->getSymbol()} {/if}{$currency->getCurrency()}
									</button>
								{/foreach}
							</form>
						</div>
					{/block}
				{/block}
            {/block}
        </div>
    {/if}
{/block}