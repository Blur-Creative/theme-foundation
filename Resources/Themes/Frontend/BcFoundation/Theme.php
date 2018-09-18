<?php

namespace Shopware\Themes\BcFoundation;

use Doctrine\Common\Collections\ArrayCollection;
use Shopware\Components\Form as Form;
use Shopware\Components\Theme\ConfigSet;

class Theme extends \Shopware\Components\Theme
{
    protected $extend = 'Responsive';

    protected $name = <<<'SHOPWARE_EOD'
Foudation
SHOPWARE_EOD;

    protected $description = <<<'SHOPWARE_EOD'
Dieses Theme ist die Grundlage vieler unsere Themes
SHOPWARE_EOD;

    protected $author = <<<'SHOPWARE_EOD'
Robert Bisovski - BlurCreative
SHOPWARE_EOD;

    protected $license = <<<'SHOPWARE_EOD'
property
SHOPWARE_EOD;

	protected $injectBeforePlugins = true;

    /** @var array Defines the files which should be compiled by the javascript compressor */
    protected $css = array(
    );

	    /**
     * Holds default theme colors.
     *
     * @var array
     */
    private $themeColorDefaults = [
		// base colors
		'brand-primary' => '#ff5a5f',
		'brand-primary-light' => 'screen(@brand-primary, @shade-800);',
		'brand-secondary' => '#00ad8e',
		'brand-success' => '@highlight-success',
		'brand-info' => '@highlight-info',
		'brand-warning' => '@highlight-notice',
		'brand-danger' => '@highlight-error',
		'brand-light' => 'screen(@gray, @shade-400)',
		'brand-dark' => 'multiply(@gray, @shade-700)',
		// grays
		'gray' => '#cccccc',
		'gray-light' => 'screen(@gray, @shade-400)',
		'gray-dark' => 'multiply(@gray, @shade-400)',
		// border colors
		'border-color' => 'rgba(0, 0, 0, 0.15)',
		// highlight colors
		'highlight-success' => '#28a745',
		'highlight-error' => '#dc3545',
		'highlight-notice' => '#ffc107',
		'highlight-info' => '#156beb',
		// typography
		'font-light-weight' => '300',
		'font-base-weight' => '400',
		'font-medium-weight' => '600',
		'font-bold-weight' => '800',
		// buttons
		'btn-default-top-bg' => 'rgba(255,255,255,0.1)',
		'btn-default-bottom-bg' => 'rgba(255,255,255,0)',
		'btn-default-hover-bg' => '@gray-light',
		'btn-default-text-color' => '@brand-dark',
		'btn-default-hover-text-color' => '@btn-default-text-color',
		'btn-default-hover-border-color' => '@btn-default-border-color',
		'btn-primary-top-bg' => '@btn-default-top-bg',
		'btn-primary-bottom-bg' => '@btn-default-bottom-bg',
        'btn-primary-hover-bg' => '@brand-primary-light',
		'btn-secondary-top-bg' => '@btn-default-top-bg',
		'btn-secondary-bottom-bg' => '@btn-default-bottom-bg',
		'btn-secondary-hover-bg' => '@brand-secondary-light',
		// text colors
		'text-color' => '@brand-dark',
		'text-muted' => '#aaaaaa',
		'button-link-color' => '@brand-dark',
		// forms
		'input-bg' => '#ffffff',
		'input-color' => '@text-color',
		'input-font-size' => '14',
		'input-focus-color' => '@text-color',
		'input-placeholder-color' => '@gray-dark',
		// Offcanvas color settings
		'offcanvas-bg-color' => '#ffffff',
		'offcanvas-navigation-headline-bg-color' => '@gray-light',
		// Breadcrumb color settings
		'breadcrumb-bg-color' => '#f6f6f6',
		'breadcrumb-text-color' => '@brand-dark',
		'breadcrumb-separator-color' => '@gray-light',
		// Product Image Background
		'image-background-color' => '#ffffff',
		'manufacturer-background-color' => '#ffffff',
		// Sliders Color Settings
		'slider-arrow-bg-color' => '@gray-light',
		'slider-arrow-icon-color' => '@btn-default-text-color',
		// Forms
		'select-field-arrow-color' => '@gray-dark',
		// Badge color settings
		'badge-default-bg-color' => '#ffffff',
		'badge-default-text-color' => '@text-color',
		// Tab Menu colors
		'tab-link-text-color' => 'screen(@brand-dark, @shade-600)',
		'tab-link-active-text-color' => '@text-color-dark',
		'tab-link-hover-text-color' => '@link-color',
		'tab-link-active-border-color' => '@brand-dark',
		'tab-link-hover-border-color' => '@brand-primary',
		// Dropdown Menu
		'dropdown-menu-bg-color' => '#ffffff',
		'dropdown-link-hover-bg-color' => '@gray-light',
	];
	
	private $themeConfigDefaults = [
		'mobileLogo' => 'frontend/_public/src/img/logos/logo--mobile.png'
		'tabletLogo' => 'frontend/_public/src/img/logos/logo--tablet.png'
		'tabletLandscapeLogo' => 'frontend/_public/src/img/logos/logo--tablet.png'
		'desktopLogo' => 'frontend/_public/src/img/logos/logo--tablet.png'
	];

    /**
     * Javascript files which will be used in the theme
     *
     * @var array
     */
    protected $javascript = [
		// vendors
		'vendors/js/bootstrap.bundle.min.js',
		'vendors/js/owl.carousel.min.js',
		// internal
		'src/js/jquery.drop-down-menu.js',
		'src/js/jquery.bc.sidebar-category-nav.js',
		'src/js/jquery.bc.sticky-nav.js',
		'src/js/jquery.shopware-responsive.js'
    ];

	/**
	 * Discard Less files from Responsive Theme
	 */
	protected $discardedLessThemes = [\Shopware\Themes\Responsive\Theme::class];
	
	/**
	 * Discard Theme Config from Bare and Responsive Theme
	 */
	protected $inheritanceConfig = false;
	
	
    /**
     * Helper function to get the attribute of a checkbox field which shows a description label
     *
     * @param string $snippetName
     * @param string $labelType
     *
     * @return array
     */
    private function getLabelAttribute($snippetName, $labelType = 'boxLabel')
    {
        $description = Shopware()->Snippets()->getNamespace('themes/bare/backend/config')->get($snippetName);

        return ['attributes' => [$labelType => $description]];
    }
	
    /**
     * Holds default fieldSet configuration.
     *
     * @var array
     */
    private $fieldSetDefaults = [
        'layout' => 'column',
        'height' => 170,
        'flex' => 0,
        'defaults' => ['columnWidth' => 0.5, 'labelWidth' => 180, 'margin' => '3 16 3 0'],
    ];

	/**
	 * @param Form\Container\TabContainer $container
		Creates Views config main tabs
	 */
	public function createConfig(Form\Container\TabContainer $container)
	{
        $tab_logo_favicons = $this->createTab(
            'bareMain',
            '__bare_tab_header__',
            [
                'attributes' => [
                    'layout' => 'anchor',
                    'autoScroll' => true,
                    'padding' => '0',
                ],
            ]
        );
		
        $tab_color_settings = $this->createTab(
            'responsive_tab',
            '__responsive_colors__'
        );

        $tab_advanced_color_settings = $this->createTab(
            'advanced_color_settings',
            '__advanced_color_settings__',
            [
                'attributes' => [
                    'layout' => 'anchor',
                    'autoScroll' => true,
                    'padding' => '0',
                ],
            ]
        );

		$container->addTab($tab_logo_favicons);
		$container->addTab($this->createMainConfigTab());
		$container->addTab($tab_color_settings);
		$container->addTab($tab_advanced_color_settings);

		$tab_logo_favicons->addElement($this->createLogoSettings());
		$tab_logo_favicons->addElement($this->createFaviconSettings());
		
		$tab_color_settings->addElement($this->createBottomTabPanel());
		
		$tab_advanced_color_settings->addElement($this->createAdvancedColorSettings());
	}

    private function createLogoSettings()
    {
        $fieldset = $this->createFieldSet(
            'bareLogos',
            '__logos__',
            [
                'attributes' => [
                    'padding' => '10',
                    'margin' => '5',
                    'layout' => 'anchor',
                    'defaults' => ['labelWidth' => 155, 'anchor' => '100%'],
                ],
            ]
        );

        $fieldset->addElement(
            $this->createMediaField(
                'mobileLogo',
                '__smartphone__',
                $this->themeConfigDefaults['mobileLogo'],
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $fieldset->addElement(
            $this->createMediaField(
                'tabletLogo',
                '__tablet__',
                $this->themeConfigDefaults['tabletLogo'],
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $fieldset->addElement(
            $this->createMediaField(
                'tabletLandscapeLogo',
                '__tablet_landscape__',
                $this->themeConfigDefaults['tabletLandscapeLogo'],
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $fieldset->addElement(
            $this->createMediaField(
                'desktopLogo',
                '__desktop__',
                $this->themeConfigDefaults['desktopLogo'],
                ['attributes' => ['lessCompatible' => false]]
            )
        );
		
		return $fieldset;
	}

    private function createFaviconSettings()
    {
        $fieldSet = $this->createFieldSet(
            'Icons',
            '__icons__',
            [
                'attributes' => [
                    'padding' => '10',
                    'margin' => '5',
                    'layout' => 'anchor',
                    'defaults' => ['labelWidth' => 155, 'anchor' => '100%'],
                ],
            ]
        );

        $fieldSet->addElement(
            $this->createMediaField(
                'appleTouchIcon',
                '__apple_touch_icon__',
                'frontend/_public/src/img/apple-touch-icon-precomposed.png',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $fieldSet->addElement(
            $this->createCheckboxField(
                'setPrecomposed',
                'Precomposed Icon',
                true,
                $this->getLabelAttribute(
                    'apple_touch_icon_precomposed'
                )
            )
        );

        $fieldSet->addElement(
            $this->createMediaField(
                'win8TileImage',
                '__win8_tile_image__',
                'frontend/_public/src/img/win-tile-image.png',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $fieldSet->addElement(
            $this->createMediaField(
                'favicon',
                '__favicon__',
                'frontend/_public/src/img/favicon.ico',
                ['attributes' => ['lessCompatible' => false]]
            )
        );
		
		return $fieldSet;
	}
	
	
    /**
     * Helper function to create the main tab ("Responsive configuration").
     *
     * @return Form\Container\Tab
     */
    public function createMainConfigTab()
    {
        $tab = $this->createTab(
            'responsiveMain',
            '__responsive_tab_header__',
            [
                'attributes' => [
                    'layout' => 'anchor',
                    'autoScroll' => true,
                    'padding' => '0',
                    'defaults' => ['anchor' => '100%'],
                ],
            ]
        );

        $fieldSet = $this->createFieldSet(
            'bareGlobal',
            '__global_configuration__',
            [
                'attributes' => [
                    'padding' => '10',
                    'margin' => '5',
                    'layout' => 'anchor',
                    'defaults' => ['labelWidth' => 155, 'anchor' => '100%'],
                ],
            ]
        );

        $fieldSet->addElement(
            $this->createCheckboxField(
                'offcanvasCart',
                '__offcanvas_cart__',
                true,
                $this->getLabelAttribute(
                    'offcanvas_cart_description'
                )
            )
        );

        $fieldSet->addElement(
            $this->createCheckboxField(
                'offcanvasOverlayPage',
                '__offcanvas_move_method__',
                true,
                $this->getLabelAttribute(
                    'offcanvas_move_method_description'
                )
            )
        );

        $fieldSet->addElement(
            $this->createCheckboxField(
                'focusSearch',
                '__focus_search__',
                false,
                $this->getLabelAttribute(
                    'focus_search_description'
                )
            )
        );

        $fieldSet->addElement(
            $this->createCheckboxField(
                'displaySidebar',
                '__display_sidebar__',
                true,
                $this->getLabelAttribute(
                    'display_sidebar_description'
                )
            )
        );

        $fieldSet->addElement(
            $this->createCheckboxField(
                'sidebarFilter',
                '__show_filter_in_sidebar__',
                false,
                $this->getLabelAttribute(
                    'show_filter_in_sidebar_description'
                )
            )
        );

        $fieldSet->addElement(
            $this->createCheckboxField(
                'checkoutHeader',
                '__checkout_header__',
                true,
                $this->getLabelAttribute(
                    'checkout_header_description'
                )
            )
        );

        $fieldSet->addElement(
            $this->createCheckboxField(
                'checkoutFooter',
                '__checkout_footer__',
                true,
                $this->getLabelAttribute(
                    'checkout_footer_description'
                )
            )
        );

        $fieldSet->addElement(
            $this->createCheckboxField(
                'infiniteScrolling',
                '__enable_infinite_scrolling__',
                true,
                $this->getLabelAttribute(
                    'enable_infinite_scrolling_description'
                )
            )
        );

        $fieldSet->addElement(
            $this->createNumberField(
                'infiniteThreshold',
                '__infinite_threshold__',
                4,
                $this->getLabelAttribute(
                    'infinite_threshold_description',
                    'supportText'
                )
            )
        );

        $fieldSet->addElement(
            $this->createSelectField(
                'lightboxZoomFactor',
                '__lightbox_zoom_factor__',
                0,
                [
                    ['value' => 0, 'text' => '__lightbox_zoom_factor_auto__'],
                    ['value' => 1, 'text' => '__lightbox_zoom_factor_none__'],
                    ['value' => 2, 'text' => '__lightbox_zoom_factor_2x__'],
                    ['value' => 3, 'text' => '__lightbox_zoom_factor_3x__'],
                    ['value' => 5, 'text' => '__lightbox_zoom_factor_5x__'],
                ],
                $this->getLabelAttribute(
                    'lightbox_zoom_factor_description',
                    'supportText'
                )
            )
        );

        $fieldSet->addElement(
            $this->createTextField(
                'appleWebAppTitle',
                '__apple_web_app_title__',
                '',
                ['attributes' => ['lessCompatible' => false]]
            )
        );

        $fieldSet->addElement(
            $this->createCheckboxField(
                'ajaxVariantSwitch',
                '__ajax_variant_switch__',
                true,
                ['attributes' => [
                    'lessCompatible' => false,
                    'boxLabel' => Shopware()->Snippets()->getNamespace('themes/bare/backend/config')->get('ajax_variant_switch_description'),
                ]]
            )
        );

        $fieldSet->addElement(
            $this->createCheckboxField(
                'asyncJavascriptLoading',
                '__async_javascript_loading__',
                true,
                ['attributes' => [
                    'lessCompatible' => false,
                    'boxLabel' => Shopware()->Snippets()->getNamespace('themes/bare/backend/config')->get('async_javascript_loading_description'),
                ]]
            )
        );

        $tab->addElement($fieldSet);

        $fieldSet = $this->createFieldSet(
            'responsiveGlobal',
            '__advanced_settings__',
            [
                'attributes' => [
                    'padding' => '10',
                    'margin' => '5',
                    'layout' => 'anchor',
                    'defaults' => ['anchor' => '100%', 'labelWidth' => 155],
                ],
            ]
        );

        $fieldSet->addElement(
            $this->createTextAreaField(
                'additionalCssData',
                '__additional_css_data__',
                '',
                ['attributes' => ['xtype' => 'textarea', 'lessCompatible' => false], 'help' => '__additional_css_data_description__']
            )
        );

        $fieldSet->addElement(
            $this->createTextAreaField(
                'additionalJsLibraries',
                '__additional_js_libraries__',
                '',
                ['attributes' => ['xtype' => 'textarea', 'lessCompatible' => false], 'help' => '__additional_js_libraries_description__']
            )
        );

        $tab->addElement($fieldSet);

        return $tab;
    }
	
	private function createBottomTabPanel()
    {
        $tabPanel = $this->createTabPanel(
            'bottom_tab_panel',
            [
                'attributes' => [
                    'plain' => true,
                ],
            ]
        );

        $tabPanel->addTab($this->createGeneralTab());
        $tabPanel->addTab($this->createTypographyTab());
        $tabPanel->addTab($this->createButtonsTab());
        $tabPanel->addTab($this->createFormsTab());
        $tabPanel->addTab($this->createTablesTab());

        return $tabPanel;
    }
	
    private function createGeneralTab()
    {
        $tab = $this->createTab(
            'general_tab',
            '__responsive_tab_general__',
            [
                'attributes' => [
                    'autoScroll' => true,
                ],
            ]
        );

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 130]);
        $fieldSetBasic = $this->createFieldSet(
            'basic_field_set',
            '__responsive_tab_general_fieldset_base__',
            ['attributes' => $attributes]
        );

        $fieldSetBasic->addElement(
            $this->createColorPickerField(
                'brand-primary',
                '@brand-primary',
                $this->themeColorDefaults['brand-primary']
            )
        );
        $fieldSetBasic->addElement(
            $this->createColorPickerField(
                'brand-primary-light',
                '@brand-primary-light',
                $this->themeColorDefaults['brand-primary-light']
            )
        );
        $fieldSetBasic->addElement(
            $this->createColorPickerField(
                'brand-secondary',
                '@brand-secondary',
                $this->themeColorDefaults['brand-secondary']
            )
        );
        $fieldSetBasic->addElement(
            $this->createColorPickerField(
                'brand-secondary-dark',
                '@brand-secondary-dark',
                $this->themeColorDefaults['brand-secondary-dark']
            )
        );
		
        $tab->addElement($fieldSetBasic);
		
        $attributes = array_merge($this->fieldSetDefaults, ['height' => 130]);
        $fieldSetGrey = $this->createFieldSet(
            'grey_tones',
            '__responsive_tab_general_fieldset_grey__',
            ['attributes' => $attributes]
        );

        $fieldSetGrey->addElement(
            $this->createColorPickerField(
                'gray',
                '@gray',
                $this->themeColorDefaults['gray']
            )
        );
        $fieldSetGrey->addElement(
            $this->createColorPickerField(
                'gray-light',
                '@gray-light',
                $this->themeColorDefaults['gray-light']
            )
        );
        $fieldSetGrey->addElement(
            $this->createColorPickerField(
                'gray-dark',
                '@gray-dark',
                $this->themeColorDefaults['gray-dark']
            )
        );
        $fieldSetGrey->addElement(
            $this->createColorPickerField(
                'border-color',
                '@border-color',
                $this->themeColorDefaults['border-color']
            )
        );
		
        $tab->addElement($fieldSetGrey);

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 130]);
        $fieldSetHighlights = $this->createFieldSet(
            'highlight_colors',
            '__responsive_tab_general_fieldset_highlight__',
            ['attributes' => $attributes]
        );

        $fieldSetHighlights->addElement(
            $this->createColorPickerField(
                'highlight-success',
                '@highlight-success',
                $this->themeColorDefaults['highlight-success']
            )
        );
        $fieldSetHighlights->addElement(
            $this->createColorPickerField(
                'highlight-error',
                '@highlight-error',
                $this->themeColorDefaults['highlight-error']
            )
        );
        $fieldSetHighlights->addElement(
            $this->createColorPickerField(
                'highlight-notice',
                '@highlight-notice',
                $this->themeColorDefaults['highlight-notice']
            )
        );
        $fieldSetHighlights->addElement(
            $this->createColorPickerField(
                'highlight-info',
                '@highlight-info',
                $this->themeColorDefaults['highlight-info']
            )
        );

        $tab->addElement($fieldSetHighlights);

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 220]);
        $fieldSetScaffolding = $this->createFieldSet(
            'scaffolding',
            '__responsive_tab_general_fieldset_scaffolding__',
            ['attributes' => $attributes]
        );

        $fieldSetScaffolding->addElement(
            $this->createColorPickerField(
                'body-bg',
                '@body-bg',
                $this->themeColorDefaults['body-bg']
            )
        );
        $fieldSetScaffolding->addElement(
            $this->createColorPickerField(
                'text-color',
                '@text-color',
                $this->themeColorDefaults['text-color']
            )
        );
        $fieldSetScaffolding->addElement(
            $this->createColorPickerField(
                'text-color-dark',
                '@text-color-dark',
                $this->themeColorDefaults['text-color-dark']
            )
        );
        $fieldSetScaffolding->addElement(
            $this->createColorPickerField(
                'link-color',
                '@link-color',
                $this->themeColorDefaults['link-color']
            )
        );
        $fieldSetScaffolding->addElement(
            $this->createColorPickerField(
                'link-hover-color',
                '@link-hover-color',
                $this->themeColorDefaults['link-hover-color']
            )
        );
        $fieldSetScaffolding->addElement(
            $this->createColorPickerField(
                'rating-star-color',
                '@rating-star-color',
                $this->themeColorDefaults['rating-star-color']
            )
        );
        $fieldSetScaffolding->addElement(
            $this->createColorPickerField(
                'overlay-bg',
                '@overlay-bg',
                $this->themeColorDefaults['overlay-bg']
            )
        );

        $fieldSetScaffolding->addElement(
            $this->createColorPickerField(
                'overlay-theme-dark-bg',
                '@overlay-theme-dark-bg',
                '@overlay-bg'
            )
        );

        $fieldSetScaffolding->addElement(
            $this->createColorPickerField(
                'overlay-theme-light-bg',
                '@overlay-theme-light-bg',
                '#FFFFFF'
            )
        );

        $fieldSetScaffolding->addElement(
            $this->createColorPickerField(
                'overlay-opacity',
                '@overlay-opacity',
                $this->themeColorDefaults['overlay-opacity']
            )
        );

        $tab->addElement($fieldSetScaffolding);

        return $tab;
    }
	
	
    private function createTypographyTab()
    {
        $tab = $this->createTab(
            'typo_tab',
            '__responsive_tab_typo__',
            ['attributes' => ['autoScroll' => true]]
        );

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 170]);
        $fieldSetBasic = $this->createFieldSet(
            'typo_base',
            '__responsive_tab_typo_fieldset_base__',
            ['attributes' => $attributes]
        );

        $fieldSetBasic->addElement(
            $this->createTextField(
                'font-base-stack',
                '@font-base-stack',
                $this->themeFontDefaults['font-base-stack']
            )
        );
        $fieldSetBasic->addElement(
            $this->createTextField(
                'font-headline-stack',
                '@font-headline-stack',
                $this->themeFontDefaults['font-headline-stack']
            )
        );
        $fieldSetBasic->addElement(
            $this->createTextField(
                'font-size-base',
                '@font-size-base',
                $this->themeFontDefaults['font-size-base']
            )
        );
        $fieldSetBasic->addElement(
            $this->createTextField(
                'font-base-weight',
                '@font-base-weight',
                $this->themeFontDefaults['font-base-weight']
            )
        );
        $fieldSetBasic->addElement(
            $this->createTextField(
                'font-light-weight',
                '@font-light-weight',
                $this->themeFontDefaults['font-light-weight']
            )
        );
        $fieldSetBasic->addElement(
            $this->createTextField(
                'font-bold-weight',
                '@font-bold-weight',
                $this->themeFontDefaults['font-bold-weight']
            )
        );

        $tab->addElement($fieldSetBasic);

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 170]);
        $fieldSetHeadlines = $this->createFieldSet(
            'typo_headlines',
            '__responsive_tab_typo_fieldset_headlines__',
            ['attributes' => $attributes]
        );

        $fieldSetHeadlines->addElement(
            $this->createTextField(
                'font-size-h1',
                '@font-size-h1',
                $this->themeFontDefaults['font-size-h1']
            )
        );
        $fieldSetHeadlines->addElement(
            $this->createTextField(
                'font-size-h2',
                '@font-size-h2',
                $this->themeFontDefaults['font-size-h2']
            )
        );
        $fieldSetHeadlines->addElement(
            $this->createTextField(
                'font-size-h3',
                '@font-size-h3',
                $this->themeFontDefaults['font-size-h3']
            )
        );
        $fieldSetHeadlines->addElement(
            $this->createTextField(
                'font-size-h4',
                '@font-size-h4',
                $this->themeFontDefaults['font-size-h4']
            )
        );
        $fieldSetHeadlines->addElement(
            $this->createTextField(
                'font-size-h5',
                '@font-size-h5',
                $this->themeFontDefaults['font-size-h5']
            )
        );
        $fieldSetHeadlines->addElement(
            $this->createTextField(
                'font-size-h6',
                '@font-size-h6',
                $this->themeFontDefaults['font-size-h6']
            )
        );

        $tab->addElement($fieldSetHeadlines);

        return $tab;
    }
	
	
    /**
     * Helper function to create the tab ("Buttons & Panels").
     *
     * @return Form\Container\Tab
     */
    private function createButtonsTab()
    {
        $tab = $this->createTab(
            'buttons_tab',
            '__responsive_tab_buttons__',
            [
                'attributes' => [
                    'autoScroll' => true,
                ],
            ]
        );

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 90]);
        $fieldSetButtons = $this->createFieldSet(
            'buttons_fieldset',
            '__responsive_tab_buttons_fieldset_global__',
            ['attributes' => $attributes]
        );

        $fieldSetButtons->addElement(
            $this->createTextField(
                'btn-font-size',
                '@btn-font-size',
                $this->themeFontDefaults['btn-font-size']
            )
        );
        $fieldSetButtons->addElement(
            $this->createTextField(
                'btn-icon-size',
                '@btn-icon-size',
                $this->themeFontDefaults['btn-icon-size']
            )
        );

        $tab->addElement($fieldSetButtons);

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 200]);
        $fieldSetDefaultButtons = $this->createFieldSet(
            'buttons_default_fieldset',
            '__responsive_tab_buttons_fieldset_default__',
            ['attributes' => $attributes]
        );

        $fieldSetDefaultButtons->addElement(
            $this->createColorPickerField(
                'btn-default-top-bg',
                '@btn-default-top-bg',
                $this->themeColorDefaults['btn-default-top-bg']
            )
        );
        $fieldSetDefaultButtons->addElement(
            $this->createColorPickerField(
                'btn-default-bottom-bg',
                '@btn-default-bottom-bg',
                $this->themeColorDefaults['btn-default-bottom-bg']
            )
        );
        $fieldSetDefaultButtons->addElement(
            $this->createColorPickerField(
                'btn-default-hover-bg',
                '@btn-default-hover-bg',
                $this->themeColorDefaults['btn-default-hover-bg']
            )
        );
        $fieldSetDefaultButtons->addElement(
            $this->createColorPickerField(
                'btn-default-text-color',
                '@btn-default-text-color',
                $this->themeColorDefaults['btn-default-text-color']
            )
        );
        $fieldSetDefaultButtons->addElement(
            $this->createColorPickerField(
                'btn-default-hover-text-color',
                '@btn-default-hover-text-color',
                $this->themeColorDefaults['btn-default-hover-text-color']
            )
        );
        $fieldSetDefaultButtons->addElement(
            $this->createColorPickerField(
                'btn-default-border-color',
                '@btn-default-border-color',
                $this->themeColorDefaults['btn-default-border-color']
            )
        );
        $fieldSetDefaultButtons->addElement(
            $this->createColorPickerField(
                'btn-default-hover-border-color',
                '@btn-default-hover-border-color',
                $this->themeColorDefaults['btn-default-hover-border-color']
            )
        );

        $tab->addElement($fieldSetDefaultButtons);

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 170]);
        $fieldSetPrimaryButtons = $this->createFieldSet(
            'buttons_primary_fieldset',
            '__responsive_tab_buttons_fieldset_primary__',
            ['attributes' => $attributes]
        );

        $fieldSetPrimaryButtons->addElement(
            $this->createColorPickerField(
                'btn-primary-top-bg',
                '@btn-primary-top-bg',
                $this->themeColorDefaults['btn-primary-top-bg']
            )
        );
        $fieldSetPrimaryButtons->addElement(
            $this->createColorPickerField(
                'btn-primary-bottom-bg',
                '@btn-primary-bottom-bg',
                $this->themeColorDefaults['btn-primary-bottom-bg']
            )
        );
        $fieldSetPrimaryButtons->addElement(
            $this->createColorPickerField(
                'btn-primary-hover-bg',
                '@btn-primary-hover-bg',
                $this->themeColorDefaults['btn-primary-hover-bg']
            )
        );
        $fieldSetPrimaryButtons->addElement(
            $this->createColorPickerField(
                'btn-primary-text-color',
                '@btn-primary-text-color',
                $this->themeColorDefaults['btn-primary-text-color']
            )
        );
        $fieldSetPrimaryButtons->addElement(
            $this->createColorPickerField(
                'btn-primary-hover-text-color',
                '@btn-primary-hover-text-color',
                $this->themeColorDefaults['btn-primary-hover-text-color']
            )
        );

        $tab->addElement($fieldSetPrimaryButtons);

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 170]);
        $fieldSetSecondaryButtons = $this->createFieldSet(
            'buttons_secondary_fieldset',
            '__responsive_tab_buttons_fieldset_secondary__',
            ['attributes' => $attributes]
        );

        $fieldSetSecondaryButtons->addElement(
            $this->createColorPickerField(
                'btn-secondary-top-bg',
                '@btn-secondary-top-bg',
                $this->themeColorDefaults['btn-secondary-top-bg']
            )
        );
        $fieldSetSecondaryButtons->addElement(
            $this->createColorPickerField(
                'btn-secondary-bottom-bg',
                '@btn-secondary-bottom-bg',
                $this->themeColorDefaults['btn-secondary-bottom-bg']
            )
        );
        $fieldSetSecondaryButtons->addElement(
            $this->createColorPickerField(
                'btn-secondary-hover-bg',
                '@btn-secondary-hover-bg',
                $this->themeColorDefaults['btn-secondary-hover-bg']
            )
        );
        $fieldSetSecondaryButtons->addElement(
            $this->createColorPickerField(
                'btn-secondary-text-color',
                '@btn-secondary-text-color',
                $this->themeColorDefaults['btn-secondary-text-color']
            )
        );
        $fieldSetSecondaryButtons->addElement(
            $this->createColorPickerField(
                'btn-secondary-hover-text-color',
                '@btn-secondary-hover-text-color',
                $this->themeColorDefaults['btn-secondary-hover-text-color']
            )
        );

        $tab->addElement($fieldSetSecondaryButtons);

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 170]);
        $fieldSetPanels = $this->createFieldSet(
            'panels_fieldset',
            '__responsive_tab_buttons_fieldset_panels__',
            ['attributes' => $attributes]
        );

        $fieldSetPanels->addElement(
            $this->createColorPickerField(
                'panel-header-bg',
                '@panel-header-bg',
                $this->themeColorDefaults['panel-header-bg']
            )
        );
        $fieldSetPanels->addElement(
            $this->createTextField(
                'panel-header-font-size',
                '@panel-header-font-size',
                $this->themeFontDefaults['panel-header-font-size']
            )
        );
        $fieldSetPanels->addElement(
            $this->createColorPickerField(
                'panel-header-color',
                '@panel-header-color',
                $this->themeColorDefaults['panel-header-color']
            )
        );
        $fieldSetPanels->addElement(
            $this->createColorPickerField(
                'panel-border',
                '@panel-border',
                $this->themeColorDefaults['panel-border']
            )
        );
        $fieldSetPanels->addElement(
            $this->createColorPickerField(
                'panel-bg',
                '@panel-bg',
                $this->themeColorDefaults['panel-bg']
            )
        );

        $tab->addElement($fieldSetPanels);

        return $tab;
    }

	
	
    /**
     * Helper function to create the tab ("Forms").
     *
     * @return Form\Container\Tab
     */
    private function createFormsTab()
    {
        $tab = $this->createTab(
            'forms_tab',
            '__responsive_tab_forms__',
            [
                'attributes' => [
                    'autoScroll' => true,
                ],
            ]
        );

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 90]);
        $fieldSetLabels = $this->createFieldSet(
            'labels_fieldset',
            '__responsive_tab_forms_fieldset_labels__',
            ['attributes' => $attributes]
        );

        $fieldSetLabels->addElement(
            $this->createTextField(
                'label-font-size',
                '@label-font-size',
                $this->themeFontDefaults['label-font-size']
            )
        );
        $fieldSetLabels->addElement(
            $this->createColorPickerField(
                'label-color',
                '@label-color',
                $this->themeColorDefaults['label-color']
            )
        );

        $tab->addElement($fieldSetLabels);

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 160]);
        $fieldSetFormBase = $this->createFieldSet(
            'form_base_fieldset',
            '__responsive_tab_forms_fieldset_global__',
            ['attributes' => $attributes]
        );

        $fieldSetFormBase->addElement(
            $this->createTextField(
                'input-font-size',
                '@input-font-size',
                $this->themeFontDefaults['input-font-size']
            )
        );
        $fieldSetFormBase->addElement(
            $this->createColorPickerField(
                'input-bg',
                '@input-bg',
                $this->themeColorDefaults['input-bg']
            )
        );
        $fieldSetFormBase->addElement(
            $this->createColorPickerField(
                'input-color',
                '@input-color',
                $this->themeColorDefaults['input-color']
            )
        );
        $fieldSetFormBase->addElement(
            $this->createColorPickerField(
                'input-placeholder-color',
                '@input-placeholder-color',
                $this->themeColorDefaults['input-placeholder-color']
            )
        );
        $fieldSetFormBase->addElement(
            $this->createColorPickerField(
                'input-border',
                '@input-border',
                $this->themeColorDefaults['input-border']
            )
        );

        $tab->addElement($fieldSetFormBase);

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 240]);
        $fieldSetFormStates = $this->createFieldSet(
            'form_states_fieldset',
            '__responsive_tab_forms_fieldset_states__',
            ['attributes' => $attributes]
        );

        $fieldSetFormStates->addElement(
            $this->createColorPickerField(
                'input-focus-bg',
                '@input-focus-bg',
                $this->themeColorDefaults['input-focus-bg']
            )
        );
        $fieldSetFormStates->addElement(
            $this->createColorPickerField(
                'input-focus-border',
                '@input-focus-border',
                $this->themeColorDefaults['input-focus-border']
            )
        );
        $fieldSetFormStates->addElement(
            $this->createColorPickerField(
                'input-focus-color',
                '@input-focus-color',
                $this->themeColorDefaults['input-focus-color']
            )
        );
        $fieldSetFormStates->addElement(
            $this->createColorPickerField(
                'input-error-bg',
                '@input-error-bg',
                $this->themeColorDefaults['input-error-bg']
            )
        );
        $fieldSetFormStates->addElement(
            $this->createColorPickerField(
                'input-error-border',
                '@input-error-border',
                $this->themeColorDefaults['input-error-border']
            )
        );
        $fieldSetFormStates->addElement(
            $this->createColorPickerField(
                'input-error-color',
                '@input-error-color',
                $this->themeColorDefaults['input-error-color']
            )
        );
        $fieldSetFormStates->addElement(
            $this->createColorPickerField(
                'input-success-bg',
                '@input-success-bg',
                $this->themeColorDefaults['input-success-bg']
            )
        );
        $fieldSetFormStates->addElement(
            $this->createColorPickerField(
                'input-success-border',
                '@input-success-border',
                $this->themeColorDefaults['input-success-border']
            )
        );
        $fieldSetFormStates->addElement(
            $this->createColorPickerField(
                'input-success-color',
                '@input-success-color',
                $this->themeColorDefaults['input-success-color']
            )
        );

        $tab->addElement($fieldSetFormStates);

        return $tab;
    }
	
	
    /**
     * Helper function to create the tab ("Tables & Badges").
     *
     * @return Form\Container\Tab
     */
    private function createTablesTab()
    {
        $tab = $this->createTab(
            'tables_tab',
            '__responsive_tab_tables__',
            [
                'attributes' => [
                    'autoScroll' => true,
                ],
            ]
        );

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 200]);
        $fieldSetTables = $this->createFieldSet(
            'tables_fieldset',
            '__responsive_tab_tables_fieldset_tables__',
            ['attributes' => $attributes]
        );

        $fieldSetTables->addElement(
            $this->createColorPickerField(
                'panel-table-header-bg',
                '@panel-table-header-bg',
                $this->themeColorDefaults['panel-table-header-bg']
            )
        );
        $fieldSetTables->addElement(
            $this->createColorPickerField(
                'panel-table-header-color',
                '@panel-table-header-color',
                $this->themeColorDefaults['panel-table-header-color']
            )
        );
        $fieldSetTables->addElement(
            $this->createColorPickerField(
                'table-row-bg',
                '@table-row-bg',
                $this->themeColorDefaults['table-row-bg']
            )
        );
        $fieldSetTables->addElement(
            $this->createColorPickerField(
                'table-row-color',
                '@table-row-color',
                $this->themeColorDefaults['table-row-color']
            )
        );
        $fieldSetTables->addElement(
            $this->createColorPickerField(
                'table-row-highlight-bg',
                '@table-row-highlight-bg',
                $this->themeColorDefaults['table-row-highlight-bg']
            )
        );
        $fieldSetTables->addElement(
            $this->createColorPickerField(
                'table-header-bg',
                '@table-header-bg',
                $this->themeColorDefaults['table-header-bg']
            )
        );
        $fieldSetTables->addElement(
            $this->createColorPickerField(
                'table-header-color',
                '@table-header-color',
                $this->themeColorDefaults['table-header-color']
            )
        );

        $tab->addElement($fieldSetTables);

        $attributes = array_merge($this->fieldSetDefaults, ['height' => 200]);
        $fieldSetBadges = $this->createFieldSet(
            'badges_fieldset',
            '__responsive_tab_tables_fieldset_badges__',
            ['attributes' => $attributes]
        );

        $fieldSetBadges->addElement(
            $this->createColorPickerField(
                'badge-discount-bg',
                '@badge-discount-bg',
                $this->themeColorDefaults['badge-discount-bg']
            )
        );
        $fieldSetBadges->addElement(
            $this->createColorPickerField(
                'badge-discount-color',
                '@badge-discount-color',
                $this->themeColorDefaults['badge-discount-color']
            )
        );
        $fieldSetBadges->addElement(
            $this->createColorPickerField(
                'badge-newcomer-bg',
                '@badge-newcomer-bg',
                $this->themeColorDefaults['badge-newcomer-bg']
            )
        );
        $fieldSetBadges->addElement(
            $this->createColorPickerField(
                'badge-newcomer-color',
                '@badge-newcomer-color',
                $this->themeColorDefaults['badge-newcomer-color']
            )
        );
        $fieldSetBadges->addElement(
            $this->createColorPickerField(
                'badge-recommendation-bg',
                '@badge-recommendation-bg',
                $this->themeColorDefaults['badge-recommendation-bg']
            )
        );
        $fieldSetBadges->addElement(
            $this->createColorPickerField(
                'badge-recommendation-color',
                '@badge-recommendation-color',
                $this->themeColorDefaults['badge-recommendation-color']
            )
        );
        $fieldSetBadges->addElement(
            $this->createColorPickerField(
                'badge-download-bg',
                '@badge-download-bg',
                $this->themeColorDefaults['badge-download-bg']
            )
        );
        $fieldSetBadges->addElement(
            $this->createColorPickerField(
                'badge-download-color',
                '@badge-download-color',
                $this->themeColorDefaults['badge-download-color']
            )
        );

        $tab->addElement($fieldSetBadges);

        return $tab;
    }

	
	
	public function createAdvancedColorSettings()
	{
        $tabPanel = $this->createTabPanel(
            'advanced_color_settings_tabpanel',
            [
                'attributes' => [
                    'plain' => true
                ]
            ]
        );

		$tabPanel->addTab($this->GeneralColorSettingsTab());
		$tabPanel->addTab($this->LayoutColorSettingsTab());
		$tabPanel->addTab($this->FormsColorSettingsTab());
		$tabPanel->addTab($this->BadgeColorSettingsTab());
		$tabPanel->addTab($this->TabColorSettingsTab());

		return $tabPanel;
	}
	
	

    public function GeneralColorSettingsTab()
    {

		// Create the Tab
		$tab = $this->createTab(
			'general_color_settings_tab',
			'__general_color_settings_tab__',
			array(
				'attributes' => array(
					'layout' => 'anchor',
					'flex' => 1,
					'autoScroll' => true,
				)
			)
		);

        $tab->addElement($this->BrandColorSettings());
        $tab->addElement($this->TextColorSettings());

		return $tab;
	}

    public function BrandColorSettings()
    {

        $fieldset = $this->createFieldSet(
            'brand_color_settings',
            '__brand_color_settings__',
            array(
                'attributes' => array(
                    'layout' => 'column',
                    'flex' => 0,
                    'autoScroll' => true,
                    'defaults' => array(
                        'columnWidth' => 0.5,
                        'labelWidth' => 150,
                        'margin' => '5 15 5 0'
                    )
                )
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'brand-success',
                '__brand-success__',
                $this->themeColorDefaults['brand-success']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'brand-info',
                '__brand-info__',
                $this->themeColorDefaults['brand-info']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'brand-warning',
                '__brand-warning__',
                $this->themeColorDefaults['brand-warning']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'brand-danger',
                '__brand-danger__',
                $this->themeColorDefaults['brand-danger']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'brand-light',
                '__brand-light__',
                $this->themeColorDefaults['brand-light']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'brand-dark',
                '__brand-dark__',
                $this->themeColorDefaults['brand-dark']
            )
        );

        return $fieldset;
    }

    public function TextColorSettings()
    {

        $fieldset = $this->createFieldSet(
            'text_color_settings',
            '__text_color_settings__',
            array(
                'attributes' => array(
                    'layout' => 'column',
                    'flex' => 0,
                    'autoScroll' => true,
                    'defaults' => array(
                        'columnWidth' => 0.5,
                        'labelWidth' => 150,
                        'margin' => '5 15 5 0'
                    )
                )
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'text-muted',
                '__text-muted__',
                $this->themeColorDefaults['text-muted']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'button-link-color',
                '__button-link-color__',
                $this->themeColorDefaults['button-link-color']
            )
        );

        return $fieldset;
    }

    public function LayoutColorSettingsTab()
    {

		// Create the Tab
		$tab = $this->createTab(
			'layout_color_settings_tab',
			'__layout_color_settings_tab__',
			array(
				'attributes' => array(
					'layout' => 'anchor',
					'flex' => 1,
					'autoScroll' => true,
				)
			)
		);

        $tab->addElement($this->OffcanvasColorSettings());
        $tab->addElement($this->BreadcrumbColorSettings());
        $tab->addElement($this->ProductImageColorSettings());
        $tab->addElement($this->SlidersColorSettings());

		return $tab;
	}

    public function OffcanvasColorSettings()
    {

        $fieldset = $this->createFieldSet(
            'offcanvas_color_settings',
            '__offcanvas_color_settings__',
            array(
                'attributes' => array(
                    'layout' => 'column',
                    'flex' => 0,
                    'autoScroll' => true,
                    'defaults' => array(
                        'columnWidth' => 0.5,
                        'labelWidth' => 150,
                        'margin' => '5 15 5 0'
                    )
                )
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'offcanvas-bg-color',
                '__offcanvas-bg-color__',
                $this->themeColorDefaults['offcanvas-bg-color']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'offcanvas-navigation-headline-bg-color',
                '__offcanvas-navigation-headline-bg-color__',
                $this->themeColorDefaults['offcanvas-navigation-headline-bg-color']
            )
        );

		return $fieldset;
	}

    public function BreadcrumbColorSettings()
    {

        $fieldset = $this->createFieldSet(
            'breadcrumb_color_settings',
            '__breadcrumb_color_settings__',
            array(
                'attributes' => array(
                    'layout' => 'column',
                    'flex' => 0,
                    'autoScroll' => true,
                    'defaults' => array(
                        'columnWidth' => 0.5,
                        'labelWidth' => 150,
                        'margin' => '5 15 5 0'
                    )
                )
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'breadcrumb-bg-color',
                '__breadcrumb-bg-color__',
                $this->themeColorDefaults['breadcrumb-bg-color']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'breadcrumb-text-color',
                '__breadcrumb-text-color__',
                $this->themeColorDefaults['breadcrumb-text-color']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'breadcrumb-separator-color',
                '__breadcrumb-separator-color__',
                $this->themeColorDefaults['breadcrumb-separator-color']
            )
        );

        return $fieldset;
    }

    public function ProductImageColorSettings()
    {

        $fieldset = $this->createFieldSet(
            'product_image_color_settings',
            '__product_image_color_settings__',
            array(
                'attributes' => array(
                    'layout' => 'column',
                    'flex' => 0,
                    'autoScroll' => true,
                    'defaults' => array(
                        'columnWidth' => 0.5,
                        'labelWidth' => 150,
                        'margin' => '5 15 5 0'
                    )
                )
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'image-background-color',
                '__image-background-color__',
                $this->themeColorDefaults['image-background-color']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'manufacturer-background-color',
                '__manufacturer-background-color__',
                $this->themeColorDefaults['manufacturer-background-color']
            )
        );

        return $fieldset;
    }

    public function SlidersColorSettings()
    {

        $fieldset = $this->createFieldSet(
            'sliders_color_settings',
            '__sliders_color_settings__',
            array(
                'attributes' => array(
                    'layout' => 'column',
                    'flex' => 0,
                    'autoScroll' => true,
                    'defaults' => array(
                        'columnWidth' => 0.5,
                        'labelWidth' => 150,
                        'margin' => '5 15 5 0'
                    )
                )
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'slider-arrow-bg-color',
                '__slider-arrow-bg-color__',
                $this->themeColorDefaults['slider-arrow-bg-color']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'slider-arrow-icon-color',
                '__slider-arrow-icon-color__',
                $this->themeColorDefaults['slider-arrow-icon-color']
            )
        );

        return $fieldset;
    }

	public function FormsColorSettingsTab()
	{

		// Create the Tab
		$tab = $this->createTab(
			'forms_color_settings_tab',
			'__forms_color_settings_tab__',
			array(
				'attributes' => array(
					'layout' => 'anchor',
					'flex' => 1,
					'autoScroll' => true,
				)
			)
		);

		$tab->addElement($this->SelectFieldColorSettings());

		return $tab;
	}

    public function SelectFieldColorSettings()
    {

        $fieldset = $this->createFieldSet(
            'select_field_color_settings',
            '__select_field_color_settings__',
            array(
                'attributes' => array(
                    'layout' => 'column',
                    'flex' => 0,
                    'autoScroll' => true,
                    'defaults' => array(
                        'columnWidth' => 0.5,
                        'labelWidth' => 150,
                        'margin' => '5 15 5 0'
                    )
                )
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'select-field-arrow-color',
                '__select-field-arrow-color__',
                $this->themeColorDefaults['select-field-arrow-color']
            )
        );

        return $fieldset;
    }

    public function BadgeColorSettingsTab()
    {

		// Create the Tab
		$tab = $this->createTab(
			'badge_color_settings_tab',
			'__badge_color_settings_tab__',
			array(
				'attributes' => array(
					'layout' => 'anchor',
					'flex' => 1,
					'autoScroll' => true,
				)
			)
		);

        $tab->addElement($this->BadgeDefaultSettings());

		return $tab;
	}

    public function BadgeDefaultSettings()
    {

        $fieldset = $this->createFieldSet(
            'badge_default_settings',
            '__badge_default_settings__',
            array(
                'attributes' => array(
                    'layout' => 'column',
                    'flex' => 0,
                    'autoScroll' => true,
                    'defaults' => array(
                        'columnWidth' => 0.5,
                        'labelWidth' => 150,
                        'margin' => '5 15 5 0'
                    )
                )
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'badge-default-bg-color',
                '__badge-default-bg-color__',
                $this->themeColorDefaults['badge-default-bg-color']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'badge-default-text-color',
                '__badge-default-text-color__',
                $this->themeColorDefaults['badge-default-text-color']
            )
        );

        return $fieldset;
    }

    public function TabColorSettingsTab()
    {

		// Create the Tab
		$tab = $this->createTab(
			'tab_color_settings_tab',
			'__tab_color_settings_tab__',
			array(
				'attributes' => array(
					'layout' => 'anchor',
					'flex' => 1,
					'autoScroll' => true,
				)
			)
		);

        $tab->addElement($this->TabMenuSettings());
        $tab->addElement($this->DropdownMenuSettings());

		return $tab;
	}

    public function TabMenuSettings()
    {

        $fieldset = $this->createFieldSet(
            'tab_menu_settings',
            '__tab_menu_settings__',
            array(
                'attributes' => array(
                    'layout' => 'column',
                    'flex' => 0,
                    'autoScroll' => true,
                    'defaults' => array(
                        'columnWidth' => 0.5,
                        'labelWidth' => 150,
                        'margin' => '5 15 5 0'
                    )
                )
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'tab-link-text-color',
                '__tab-link-text-color__',
                $this->themeColorDefaults['tab-link-text-color']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'tab-link-active-text-color',
                '__tab-link-active-text-color__',
                $this->themeColorDefaults['tab-link-active-text-color']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'tab-link-hover-text-color',
                '__tab-link-hover-text-color__',
                $this->themeColorDefaults['tab-link-hover-text-color']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'tab-link-active-border-color',
                '__tab-link-active-border-color__',
                $this->themeColorDefaults['tab-link-active-border-color']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'tab-link-hover-border-color',
                '__tab-link-hover-border-color__',
                $this->themeColorDefaults['tab-link-hover-border-color']
            )
        );

        return $fieldset;
    }

    public function DropdownMenuSettings()
    {

        $fieldset = $this->createFieldSet(
            'dropdown_menu_settings',
            '__dropdown_menu_settings__',
            array(
                'attributes' => array(
                    'layout' => 'column',
                    'flex' => 0,
                    'autoScroll' => true,
                    'defaults' => array(
                        'columnWidth' => 0.5,
                        'labelWidth' => 150,
                        'margin' => '5 15 5 0'
                    )
                )
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'dropdown-menu-bg-color',
                '__dropdown-menu-bg-color__',
                $this->themeColorDefaults['dropdown-menu-bg-color']
            )
        );

        $fieldset->addElement(
            $this->createColorPickerField(
                'dropdown-link-hover-bg-color',
                '__dropdown-link-hover-bg-color__',
                $this->themeColorDefaults['dropdown-link-hover-bg-color']
            )
        );

        return $fieldset;
    }

    /**
     * Helper function to merge default theme colors with color schemes.
     *
     * @param ArrayCollection $collection
     */
    public function createConfigSets(ArrayCollection $collection)
    {
        $set = new ConfigSet();
        $set->setName('__bc_foundation_color_scheme_turquoise__')->setDescription(
            '__bc_foundation_color_scheme_turquoise__'
        )->setValues($this->themeColorDefaults);
        $collection->add($set);
	}
}
