{if $checkout}
    {include file="orderforms/$carttpl/checkout.tpl"}
{else}
    {include file="orderforms/standard_cart/common.tpl"}

    <div id="order-standard_cart">
        <div id="nexus-root" data-app="cart-module"  data-init="{getNexusData}"></div>
    </div>

    <script type="text/javascript" src="{assetPath file="main.min.js"}"></script>

    <style>
        /* Redefining template styles only for this page */

        .main-navbar-wrapper, [data-target="#mainNavbar"] {
            display: none;
        }

        section#main-body {
            padding: 0 !important;
            background: transparent !important;
        }

        section#main-body .container {
            max-width: 100% !important;
        }

        section#main-body .primary-content p {
            display: none !important;
        }

        #order-standard_cart {
            padding: 0 !important;
            background: transparent !important;
        }

        #nexus-root {
            color: var(--text) !important;
        }
        #nexus-root h1, #nexus-root h2, #nexus-root h3, #nexus-root h4, #nexus-root h5, #nexus-root h6 {
            color: var(--white) !important;
        }
        #nexus-root p, #nexus-root label, #nexus-root span {
            color: var(--text-lifted) !important;
        }
        #nexus-root .card, #nexus-root .list-group-item {
            background: var(--glass-bg) !important;
            border: 1px solid var(--glass-border) !important;
            color: var(--text) !important;
        }
    </style>
{/if}
