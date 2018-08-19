{extends file='parent:frontend/account/profile.tpl'}

{block name="frontend_account_profile_profile_form"}
    <form name="profileForm" action="{url controller=account action=saveProfile}" method="post">

        {block name="frontend_account_profile_profile_panel"}
            <div class="account-profile--container">
                <div class="panel has--border is--rounded">

                    {block name="frontend_account_profile_profile_title"}
                        <div class="panel--title is--underline">{s name="ProfileHeadline"}{/s}</div>
                    {/block}

                    {block name="frontend_account_profile_profile_body"}
                        <div class="panel--body is--wide">

                            {block name="frontend_account_profile_profile_success"}
                                {if $section == 'profile' && $success}
                                    {include file="frontend/_includes/messages.tpl" type="success" content="{s name="ProfileSaveSuccessMessage"}{/s}"}
                                {/if}
                            {/block}

                            {* Error messages *}
                            {block name="frontend_account_profile_profile_errors"}
                                {if $section == 'profile' && $errorMessages}
                                    {include file="frontend/register/error_message.tpl" error_messages=["{s name="ErrorFillIn" namespace="frontend/account/internalMessages"}{/s}"]}
                                {/if}
                            {/block}

                            {* Salutation *}
                            {block name='frontend_account_profile_profile_input_salutation'}
                                {getSalutations variable="salutations"}

                                <div class="profile--salutation field--select select-field">
                                    <select name="profile[salutation]"
                                            required="required"
                                            aria-required="true"
                                            class="is--required{if $errorFlags.salutation} has--error{/if}">

                                        <option value="" disabled="disabled"{if $form_data.profile.salutation eq ""} selected="selected"{/if}>{s name='RegisterPlaceholderSalutation' namespace="frontend/register/personal_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}</option>

                                        {foreach $salutations as $key => $label}
                                            <option value="{$key}"{if $form_data.profile.salutation eq $key} selected="selected"{/if}>{$label}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            {/block}

                            {* Title *}
                            {block name='frontend_account_profile_profile_input_title'}
                                {if {config name="displayprofiletitle"}}
                                    <div class="profile--title">
                                        <input autocomplete="section-personal title"
                                               name="profile[title]"
                                               type="text"
                                               placeholder="{s name='RegisterPlaceholderTitle' namespace="frontend/register/personal_fieldset"}{/s}"
                                               value="{$form_data.profile.title|escape}"
                                               class="profile--field{if $errorFlags.title} has--error{/if}" />
                                    </div>
                                {/if}
                            {/block}

                            <div class="form-row">
                                
                                {* Firstname *}
                                {block name='frontend_account_profile_profile_input_firstname'}
                                    <div class="form-group profile--firstname">
                                        <input autocomplete="section-personal given-name"
                                               name="profile[firstname]"
                                               type="text"
                                               required="required"
                                               aria-required="true"
                                               placeholder="{s name='RegisterPlaceholderFirstname' namespace="frontend/register/personal_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}"
                                               value="{$form_data.profile.firstname|escape}" class="profile--field is--required{if $errorFlags.firstname} has--error{/if}"
                                        />
                                    </div>
                                {/block}

                                {* Lastname *}
                                {block name="frontend_account_profile_profile_input_lastname"}
                                    <div class="form-group profile--lastname">
                                        <input autocomplete="section-personal family-name"
                                               name="profile[lastname]"
                                               type="text"
                                               required="required"
                                               aria-required="true"
                                               placeholder="{s name='RegisterPlaceholderLastname' namespace="frontend/register/personal_fieldset"}{/s}{s name="RequiredField" namespace="frontend/register/index"}{/s}"
                                               value="{$form_data.profile.lastname|escape}"
                                               class="profile--field is--required{if $errorFlags.lastname} has--error{/if}"
                                        />
                                    </div>
                                {/block}
                            </div>

                            {* Birthday *}
                            {block name="frontend_account_profile_profile_input_birthday"}
                                {if {config name=showBirthdayField}}
                                    <div class="profile--birthdate">
                                        {block name="frontend_account_profile_profile_input_birthday_label"}
                                            <label class="birthday--label">{s name='RegisterPlaceholderBirthday' namespace="frontend/register/personal_fieldset"}{/s}{if {config name=requireBirthdayField}}{s name="RequiredField" namespace="frontend/register/index"}{/s}{/if}</label>
                                        {/block}

                                        {block name="frontend_account_profile_profile_input_birthday_day"}
                                            <div class="profile--birthday field--select select-field">
                                                <select name="profile[birthday][day]"
                                                        {if {config name=requireBirthdayField}} required="required" aria-required="true"{/if}
                                                        class="{if {config name=requireBirthdayField}}is--required{/if}{if $errorFlags.birthday && {config name=requireBirthdayField}} has--error{/if}">

                                                    <option{if {config name=requireBirthdayField} && $form_data.profile.birthday.day} disabled="disabled"{/if} value="">{s name='RegisterBirthdaySelectDay' namespace="frontend/register/personal_fieldset"}{/s}</option>

                                                    {for $day = 1 to 31}
                                                        <option value="{$day}" {if $day == $form_data.profile.birthday.day}selected{/if}>{$day}</option>
                                                    {/for}
                                                </select>
                                            </div>
                                        {/block}

                                        {block name="frontend_account_profile_profile_input_birthday_month"}
                                            <div class="profile--birthmonth field--select select-field">
                                                <select name="profile[birthday][month]"
                                                        {if {config name=requireBirthdayField}} required="required" aria-required="true"{/if}
                                                        class="{if {config name=requireBirthdayField}}is--required{/if}{if $errorFlags.birthday && {config name=requireBirthdayField}} has--error{/if}">

                                                    <option{if {config name=requireBirthdayField} && $form_data.profile.birthday.month} disabled="disabled"{/if} value="">{s name='RegisterBirthdaySelectMonth' namespace="frontend/register/personal_fieldset"}{/s}</option>

                                                    {for $month = 1 to 12}
                                                        <option value="{$month}" {if $month == $form_data.profile.birthday.month}selected{/if}>{$month}</option>
                                                    {/for}
                                                </select>
                                            </div>
                                        {/block}

                                        {block name="frontend_account_profile_profile_input_birthday_year"}
                                            <div class="profile--birthyear field--select select-field">
                                                <select name="profile[birthday][year]"
                                                        {if {config name=requireBirthdayField}} required="required" aria-required="true"{/if}
                                                        class="{if {config name=requireBirthdayField}}is--required{/if}{if $errorFlags.birthday && {config name=requireBirthdayField}} has--error{/if}">

                                                    <option{if {config name=requireBirthdayField} && $form_data.profile.birthday.year} disabled="disabled"{/if} value="">{s name='RegisterBirthdaySelectYear' namespace="frontend/register/personal_fieldset"}{/s}</option>

                                                    {for $year = date("Y") to date("Y")-120 step=-1}
                                                        <option value="{$year}" {if $year == $form_data.profile.birthday.year}selected{/if}>{$year}</option>
                                                    {/for}
                                                </select>
                                            </div>
                                        {/block}
                                    </div>
                                {/if}
                            {/block}

                            {block name="frontend_account_profile_profile_required_info"}
                                <div class="required-info required_fields">
                                    {s name='RegisterPersonalRequiredText' namespace='frontend/register/personal_fieldset'}{/s}
                                </div>
                            {/block}

                        </div>
                    {/block}

                    {block name="frontend_account_profile_profile_actions"}
                        <div class="panel--actions panel--footer">
                            <ul class="nav account--panel-nav">
                                <li class="nav-item account--panel-nav-item">
                                    {block name="frontend_account_profile_profile_actions_submit"}
                                        <button class="btn is--block is--center is--success" type="submit" data-preloader-button="true">
                                            {s name="ProfileSaveButton"}{/s}
                                        </button>
                                    {/block}
                                </li>
                            </ul>
                        </div>
                    {/block}
                </div>
            </div>
        {/block}
    </form>
{/block}

{block name="frontend_account_profile_email_current"}
    <div class="profile--email-current">
        <label>{s name="EmailCurrentEmailLabel"}{/s}</label>
        <div class="profile--field">
            {$sUserData.additional.user.email}
        </div>
    </div>
{/block}

{block name="frontend_account_profile_email_actions"}
    <div class="panel--actions panel--footer">
        <ul class="nav account--panel-nav">
            <li class="nav-item account--panel-nav-item">
                {block name="frontend_account_profile_email_actions_submit"}
                    <button class="btn is--block is--center is--success" type="submit" data-preloader-button="true">
                        {s name="EmailSaveButton"}{/s}
                    </button>
                {/block}
            </li>
        </ul>
    </div>
{/block}

{block name="frontend_account_profile_password_actions"}
    <div class="panel--actions panel--footer">
        <ul class="nav account--panel-nav">
            <li class="nav-item account--panel-nav-item">
                {block name="frontend_account_profile_password_actions_submit"}
                    <button class="btn is--block is--center is--success" type="submit" data-preloader-button="true">
                        {s name="PasswordSaveButton"}{/s}
                    </button>
                {/block}
            </li>
        </ul>
    </div>
{/block}