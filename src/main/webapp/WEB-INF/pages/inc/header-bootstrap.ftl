[#ftl output_format="HTML"]
[#setting date_format="yyyy-MM-dd"]
[#setting time_format="HH:mm:ss"]
[#setting datetime_format="iso"]
[#setting locale="en"]
[#setting url_escaping_charset="UTF-8"]
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>

    <style>
        html,
        body {
            overflow-x: hidden; /* Prevent scroll on narrow devices */
        }

        body {
            padding-top: 20px;
        }

        @media (max-width: 991.98px) {
            .offcanvas-collapse {
                position: fixed;
                top: 56px; /* Height of navbar */
                bottom: 0;
                left: 100%;
                width: 100%;
                padding-right: 1rem;
                padding-left: 1rem;
                overflow-y: auto;
                visibility: hidden;
                background-color: #343a40;
                transition: transform .3s ease-in-out, visibility .3s ease-in-out;
            }
            .offcanvas-collapse.open {
                visibility: visible;
                transform: translateX(-100%);
            }
        }

        .nav-scroller {
            position: fixed;
            top: 56px;
            z-index: 2;
            height: 2.75rem;
            overflow-y: hidden;
        }

        .nav-scroller .nav {
            display: flex;
            flex-wrap: nowrap;
            padding-bottom: 1rem;
            margin-top: -1px;
            overflow-x: auto;
            color: rgba(255, 255, 255, .75);
            text-align: center;
            white-space: nowrap;
            -webkit-overflow-scrolling: touch;
        }

        .nav-underline .nav-link {
            padding-top: .75rem;
            padding-bottom: .75rem;
            font-size: .875rem;
            color: #6c757d;
        }

        .nav-underline .nav-link:hover {
            color: #008959;
        }

        .nav-underline .active {
            font-weight: 500;
            color: #343a40;
        }

        .logo {
            height: 32px;
            position: relative;
            line-height: 32px;
            padding-right: 8px;
            padding-left: 8px;
            transition: all .3s;
            overflow: hidden;
            vertical-align: middle;
            fill: #008959;
        }

        .logo svg {
            vertical-align: middle;
            height: 32px;
            /*fill: #5ba734;*/
            fill: #008959;
            padding: 3px 0;
        }

        .cc-logo {
            display: block;
            height: 31px;
            width: 88px;
        }

        a {
            color: #008959;
        }

        /* Copy of .invalid-feedback, but without 'display: none' */
        .invalid-feedback-display {
            width: 100%;
            margin-top: 0.25rem;
            font-size: 0.875em;
            color: #dc3545;
        }
    </style>

[#--    <link rel="stylesheet" type="text/css" media="all" href="${baseURL}/styles/reset.css" />--]
[#--    <link rel="stylesheet" type="text/css" media="all" href="${baseURL}/styles/text.css" />--]
[#--    <link rel="stylesheet" type="text/css" media="all" href="${baseURL}/styles/960_24_col.css" />--]
[#--    <link rel="stylesheet" type="text/css" href="${baseURL}/styles/main.css" />--]
[#--    <link rel="stylesheet" type="text/css" media="all" href="${baseURL}/styles/jquery/dataTable.css"/>--]

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link href="https://cdn.datatables.net/1.10.23/css/dataTables.bootstrap5.min.css" rel="stylesheet">

    <link rel="shortcut icon" href="${baseURL}/images/icons/favicon-16x16.png" type="image/x-icon" />
    <link href="${baseURL}/rss.do" title="Latest Resources" rel="alternate" type="application/rss+xml" />
    <link media="all" type="text/css" href="${baseURL}/styles/jquery/jquery-ui.min-1.12.1.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${baseURL}/styles/font-awesome.min.css" media="all" />
    <!-- for css overrides needed for customizations -->
[#--    <link rel="stylesheet" type="text/css" href="${baseURL}/styles/custom.css" />--]
    <!-- for support of old browsers, like IE8. See http://modernizr.com/docs/#html5inie -->
    <script type="text/javascript" src="${baseURL}/js/modernizr.js"></script>
    <script type="text/javascript" src="${baseURL}/js/jquery/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="${baseURL}/js/jquery/jquery-ui.min-1.12.1.js"></script>
    <script type="text/javascript" src="${baseURL}/js/global.js"></script>
[#--    <script type="text/javascript" src="${baseURL}/js/form-validation.js"></script>--]
[#--    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>--]


    [#-- GOOGLE ANALYTICS - asynchroneous: http://code.google.com/apis/analytics/docs/tracking/asyncTracking.html --]
    [#if cfg.gbifAnalytics || (cfg.analyticsKey!"")?length>1]
        <script type="text/javascript">
            var _gaq = _gaq || [];
            [#if (cfg.analyticsKey!"")?length>1]
            _gaq.push(['_setAccount', '${cfg.analyticsKey}']);
            _gaq.push(['_trackPageview']);
            [/#if]
            [#if cfg.gbifAnalytics]
            _gaq.push(['gbif._setAccount', '${cfg.getProperty("dev.analytics.gbif")}']);
            _gaq.push(['gbif._trackPageview']);
            [/#if]
            (function() {
                var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
                ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
                var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();
        </script>
    [/#if]

    [#-- Metadata used by browsers (title in browser toolbar, bookmark when added to favorites), search engines (keywords) --]
    [#assign metaKeywords = "GBIF, Global Biodiversity Information Facility, IPT, Integrated Publishing Toolkit, checklist, occurrence, metadata, DwC-A, Darwin Core, Darwin Core Archive, biodiversity data, data paper, EML" /]
    [#assign registeredIpt = action.getRegisteredIpt()!""/]
    [#if resource?? && eml??]
        <meta name="description" content="${eml.description!}" charset="UTF-8" />
        [#if eml.subject?has_content]
            <meta name="keywords" content="${eml.subject?replace(";", ",")}" charset="UTF-8" />
        [/#if]
        <meta name="foaf:topic" content="${cfg.getResourceUri(resource.shortname)}/#dataset"/>
        <meta name="foaf:isPrimaryTopicOf" content="${cfg.getResourceUri(resource.shortname)}">
    [#elseif registeredIpt?has_content]
        <meta name="description" content="${registeredIpt.description!}" charset="UTF-8" />
        <meta name="keywords" content="${metaKeywords}" charset="UTF-8" />
    [#else]
        <meta name="description" content="The Integrated Publishing Toolkit (IPT) is a tool developed by the Global Biodiversity Information Facility (GBIF) to provide an easy and efficient way of publishing biodiversity data." charset="UTF-8"}" />
        <meta name="keywords" content="${metaKeywords}" charset="UTF-8" />
    [/#if]
    <meta name="generator" content="IPT ${cfg.version!}" />
    <meta name="inventory" content="${baseURL}/inventory/dataset"/>
    <meta name="foaf:seeAlso" content="${baseURL}/dcat"/>
    <meta http-equiv="X-UA-Compatible" content="IE=9" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript">
        $(document).ready(function(){
            [#-- see global.js for function defs --]
            initForm();
            initMenu();
        });
    </script>

    [#assign currentMenu = "home"]
