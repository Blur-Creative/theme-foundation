{extends file='parent:frontend/listing/listing_ajax.tpl'}

{block name="frontend_listing_list_inline_ajax"}
	<script type="text/javascript">
		/*
		 * init Bootstrap Tooltip funcionality
		 */
		$(function () {
		  $('[data-toggle="tooltip"]').tooltip();
		});		
	</script>

    {$smarty.block.parent}
{/block}