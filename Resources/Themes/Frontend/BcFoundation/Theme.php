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
	
	protected $discardedLessThemes = [\Shopware\Themes\Responsive\Theme::class];
	
	/**
	 * @param Form\Container\TabContainer $container
		Creates Views config main tabs
	 */
	public function createConfig(Form\Container\TabContainer $container)
	{
        $tab_logo = $this->createTab(
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
		
		$container->addTab($tab_logo);
		$container->addTab($tab_advanced_color_settings);
		
		$tab_logo->addElement($this->createLogoSettings());
		$tab_advanced_color_settings->addElement($this->createAdvancedColorSettings());
	}
	
    public function createLogoSettings()
    {
        $fieldset = $this->createFieldSet(
            'bareLogos',
            '__sushi__',
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