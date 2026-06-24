<!doctype html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    {include file="$template/includes/head.tpl"}
    {$headoutput}
</head>
<body class="primary-bg-color template-{$templatefile}{if $loggedin} logged-in{/if}" data-phone-cc-input="{$phoneNumberInputStyle}">
    {if $captcha}{$captcha->getMarkup()}{/if}
    {$headeroutput}

    <!-- Floating Space Nebulas Background -->
    <div class="space-nebulas">
        <div class="nebula nebula-amber"></div>
        <div class="nebula nebula-violet"></div>
        <div class="nebula nebula-coral"></div>
    </div>

    <div class="main-page-wrapper">
        {if $loggedin}
            <div class="topbar">
                <div class="container">
                    <div class="d-flex">
                        <div class="mr-auto">
                            <button type="button" class="btn" data-toggle="popover" id="accountNotifications" data-placement="bottom">
                                <i class="far fa-flag"></i>
                                {if count($clientAlerts) > 0}
                                    {count($clientAlerts)}
                                    <span class="d-none d-sm-inline">{lang key='notifications'}</span>
                                {else}
                                    <span class="d-sm-none">0</span>
                                    <span class="d-none d-sm-inline">{lang key='nonotifications'}</span>
                                {/if}
                            </button>
                            <div id="accountNotificationsContent" class="w-hidden">
                                <ul class="client-alerts">
                                {foreach $clientAlerts as $alert}
                                    <li>
                                        <a href="{$alert->getLink()}">
                                            <i class="fas fa-fw fa-{if $alert->getSeverity() == 'danger'}exclamation-circle{elseif $alert->getSeverity() == 'warning'}exclamation-triangle{elseif $alert->getSeverity() == 'info'}info-circle{else}check-circle{/if}"></i>
                                            <div class="message">{$alert->getMessage()}</div>
                                        </a>
                                    </li>
                                {foreachelse}
                                    <li class="none">
                                        {lang key='notificationsnone'}
                                    </li>
                                {/foreach}
                                </ul>
                            </div>
                        </div>

                        <div class="ml-auto">
                            <div class="input-group active-client" role="group">
                                <div class="input-group-prepend d-none d-md-inline">
                                    <span class="input-group-text">{lang key='loggedInAs'}:</span>
                                </div>
                                <div class="btn-group">
                                    <a href="{$WEB_ROOT}/clientarea.php?action=details" class="btn btn-active-client">
                                        <span>
                                            {if $client.companyname}
                                                {$client.companyname}
                                            {else}
                                                {$client.fullName}
                                            {/if}
                                        </span>
                                    </a>
                                    <a href="{routePath('user-accounts')}" class="btn" data-toggle="tooltip" data-placement="bottom" title="Switch Account">
                                        <i class="fad fa-random"></i>
                                    </a>
                                    {if $adminMasqueradingAsClient || $adminLoggedIn}
                                        <a href="{$WEB_ROOT}/logout.php?returntoadmin=1" class="btn btn-return-to-admin" data-toggle="tooltip" data-placement="bottom" title="{if $adminMasqueradingAsClient}{lang key='adminmasqueradingasclient'} {lang key='logoutandreturntoadminarea'}{else}{lang key='adminloggedin'} {lang key='returntoadminarea'}{/if}">
                                            <i class="fas fa-redo-alt"></i>
                                            <span class="d-none d-md-inline-block">{lang key="admin.returnToAdmin"}</span>
                                        </a>
                                    {/if}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        {/if}

        <header id="header" class="header header-floating-glass {if $loggedin}logged-in{/if}">
        <div class="container-fluid px-4 d-flex align-items-center justify-content-between w-100">
            <!-- Logo -->
            <a class="navbar-brand mr-3" href="{$WEB_ROOT}/index.php">
                <img src="{$WEB_ROOT}/templates/{$template}/images/logo.svg" alt="{$companyname}" class="logo-img" style="height: 38px;">
            </a>

            <!-- Navigation and Controls -->
            <div class="d-flex align-items-center flex-grow-1 justify-content-end">
                <!-- Centered Main Navigation (Desktop) -->
                <nav class="navbar navbar-expand-xl p-0 d-none d-xl-block">
                    <ul id="nav" class="navbar-nav align-items-center">
                        {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
                    </ul>
                </nav>

                <!-- Search Bar (Desktop only) -->
                <form method="post" action="{routePath('knowledgebase-search')}" class="form-inline d-none d-xl-flex ml-3 mr-2">
                    <div class="input-group search">
                        <div class="input-group-prepend">
                            <button class="btn btn-default" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                        <input class="form-control appended-form-control font-weight-light" type="text" name="search" placeholder="{lang key="searchOurKnowledgebase"}...">
                    </div>
                </form>

                <!-- Cart Button -->
                <a class="btn nav-link cart-btn ml-2" href="{$WEB_ROOT}/cart.php?a=view">
                    <i class="far fa-shopping-cart fa-fw"></i>
                    <span id="cartItemCount" class="badge badge-info">{$cartitemcount}</span>
                </a>

                <!-- Secondary Navbar (Account, Login dropdown - Desktop only) -->
                <nav class="navbar navbar-expand-xl p-0 d-none d-xl-block ml-3">
                    <ul class="navbar-nav align-items-center">
                        {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar rightDrop=true}
                    </ul>
                </nav>

                {if $loggedin}
                <a href="{$WEB_ROOT}/logout.php" class="logout-btn-glass text-decoration-none d-none d-xl-flex align-items-center ml-3">
                    <i class="fas fa-sign-out-alt"></i> Logout
                </a>
                {/if}

                <!-- Hamburger Button (Mobile/Tablet only) -->
                <button class="navbar-toggler ml-3 d-xl-none" type="button" data-toggle="collapse" data-target="#mainNavbar" aria-controls="mainNavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="fas fa-bars" style="color: #fff; font-size: 20px;"></span>
                </button>
            </div>
        </div>

        <!-- Mobile Navigation Drawer -->
        <div class="collapse navbar-collapse d-xl-none" id="mainNavbar">
            <div class="mobile-menu-container p-4">
                <!-- Mobile Search -->
                <form method="post" action="{routePath('knowledgebase-search')}" class="w-100 mb-4">
                    <div class="input-group search">
                        <div class="input-group-prepend">
                            <button class="btn btn-default" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                        <input class="form-control prepended-form-control" type="text" name="search" placeholder="{lang key="searchOurKnowledgebase"}...">
                    </div>
                </form>
                
                <!-- Mobile Menu Links -->
                <ul class="navbar-nav w-100">
                    {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
                    <hr style="border-top: 1px solid rgba(255,255,255,0.08); margin: 15px 0;">
                    {include file="$template/includes/navbar.tpl" navbar=$secondaryNavbar rightDrop=true}
                    {if $loggedin}
                    <hr style="border-top: 1px solid rgba(255,255,255,0.08); margin: 15px 0;">
                    <li class="nav-item">
                        <a class="nav-link text-danger" href="{$WEB_ROOT}/logout.php">
                            <i class="fas fa-sign-out-alt mr-1"></i> Logout
                        </a>
                    </li>
                    {/if}
                </ul>
            </div>
        </div>
    </header>

    {include file="$template/includes/network-issues-notifications.tpl"}

    {if count($breadcrumb) > 0}
    <nav class="master-breadcrumb" aria-label="breadcrumb">
        <div class="container">
            {include file="$template/includes/breadcrumb.tpl"}
        </div>
    </nav>
    {/if}

    {include file="$template/includes/validateuser.tpl"}
    {include file="$template/includes/verifyemail.tpl"}

    {if $templatefile == 'homepage'}
        {if $registerdomainenabled || $transferdomainenabled}
            {include file="$template/includes/domain-search.tpl"}
        {/if}
    {/if}

    <section id="main-body">
        <div class="{if !$skipMainBodyContainer}container{/if}">
            <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}row{/if}">

            {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
                <div class="col-lg-4 col-xl-3">
                    <div class="sidebar">
                        {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
                    </div>
                    {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                        <div class="d-none d-lg-block sidebar">
                            {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                        </div>
                    {/if}
                </div>
            {/if}
            <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-lg-8 col-xl-9{/if} primary-content">
