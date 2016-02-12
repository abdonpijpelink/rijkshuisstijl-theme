<nav class="${nav_css_class}" id="navigation" role="navigation">
	<ul class="top-level-menu" aria-label="<@liferay.language key="site-pages" />" role="menubar">
		<#list nav_items as nav_item>
			<#assign nav_item_attr_has_popup = "" />
			<#assign nav_item_attr_selected = "" />
			<#assign nav_item_css_class = "" />

			<#if nav_item.isSelected()>
				<#assign nav_item_attr_has_popup = "aria-haspopup='true'" />
				<#assign nav_item_attr_selected = "aria-selected='true'" />
				<#assign nav_item_css_class = "selected" />
				<#assign selected_item = nav_item />
			</#if>

			<li ${nav_item_attr_selected} class="${nav_item_css_class}" id="layout_${nav_item.getLayoutId()}" role="presentation">
				<a aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem"><span>${nav_item.icon()} ${nav_item.getName()}</span></a>
			</li>
		</#list>
	</ul>
	
	<nav id="breadcrumbs"><@liferay.breadcrumbs /></nav>

	<h1 class="page-title">
		<#if selected_item??>
			<span>${selected_item.getName()}</span>
		</#if>
	</h1>
		
	<#if selected_item?? && selected_item.hasChildren()>
		<ul class="child-menu" role="menu">
			<#list selected_item.getChildren() as nav_child>
				<#assign nav_child_attr_selected = "" />
				<#assign nav_child_css_class = "" />

				<#if nav_child.isSelected()>
					<#assign nav_child_attr_selected = "aria-selected='true'" />
					<#assign nav_child_css_class = "selected" />
				</#if>

				<li ${nav_child_attr_selected} class="${nav_child_css_class}" id="layout_${nav_child.getLayoutId()}" role="presentation">
					<a aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
				</li>
			</#list>
		</ul>
	</#if>
</nav>