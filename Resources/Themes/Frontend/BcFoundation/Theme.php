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
		// scaffolding colors
		'text-color' => '@brand-dark',
		// forms
		'input-bg' => '#ffffff',
		'input-color' => '@text-color',
		'input-font-size' => '14',
		'input-focus-color' => '@text-color',
		'input-placeholder-color' => '@gray-dark',
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