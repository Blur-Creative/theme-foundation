{* Step box *}
<div class="steps--container">
    <div class="steps--content">
        {block name='frontend_register_steps'}
            <ul class="steps--list">

                {* First Step - Address *}
                {block name='frontend_register_steps_basket'}
                    <li class="steps--entry step--basket{if $sStepActive=='address'} is--active{/if}">
                        <span class="icon">{s name="CheckoutStepAddressNumber" namespace='frontend/register/steps'}{/s}</span>
                        <span class="text"><span class="text--inner">{s name="CheckoutStepAddressText" namespace='frontend/register/steps'}{/s}</span></span>
                    </li>
                {/block}

                {* Spacer *}
                {block name='frontend_register_steps_spacer1'}
                    <li class="steps--entry steps--spacer">
                        <i class="icon--arrow-right"></i>
                    </li>
                {/block}

                {* Second Step - Payment *}
                {block name='frontend_register_steps_register'}
                    <li class="steps--entry step--register{if $sStepActive=='paymentShipping'} is--active{/if}">
                        <span class="icon">{s name="CheckoutStepPaymentShippingNumber" namespace='frontend/register/steps'}{/s}</span>
                        <span class="text"><span class="text--inner">{s name="CheckoutStepPaymentShippingText" namespace='frontend/register/steps'}{/s}</span></span>
                    </li>
                {/block}

                {* Spacer *}
                {block name='frontend_register_steps_spacer2'}
                    <li class="steps--entry steps--spacer">
                        <i class="icon--arrow-right"></i>
                    </li>
                {/block}

                {* Third Step - Confirmation *}
                {block name='frontend_register_steps_confirm'}
                    <li class="steps--entry step--confirm{if $sStepActive=='finished'} is--active{/if}">
                        <span class="icon">{s name="CheckoutStepConfirmNumber" namespace='frontend/register/steps'}{/s}</span>
                        <span class="text"><span class="text--inner">{s name="CheckoutStepConfirmText" namespace='frontend/register/steps'}{/s}</span></span>
                    </li>
                {/block}
            </ul>
        {/block}
    </div>
</div>