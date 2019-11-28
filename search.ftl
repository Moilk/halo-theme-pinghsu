<#include "header.ftl">
<#import "functions.ftl" as fun>
<@header title="搜索：${keyword} | ${options.blog_title!}" keywords="${options.seo_keywords!}" description="${options.seo_description!}"></@header>
<div class="main-content common-page clearfix">
    <div class="common-item">
        <div class="common-title">
            Search : ${keyword}
        </div>
        <div class="post-lists">
            <div class="post-lists-body">
                <#if posts?? && posts.content?size gt 0>
                    <#list posts.content as post>
                        <div class="post-list-item">
                            <div
                                class="post-list-item-container <#if settings.post_color!false>bg-<@fun.randBgColor/></#if>">
                                <div class="item-label <#if settings.post_color!false>bg-<@fun.randBgColor/></#if>">
                                    <div class="item-title"><a
                                            href="${context!}/archives/${post.url!}">${post.title!}</a></div>
                                    <div class="item-meta clearfix">
                                        <div class="item-meta-ico bg-ico-<@fun.randBgIco/>"
                                            style="background: url(${static!}/source/images/bg-ico.png) no-repeat;background-size: 40px auto;">
                                        </div>
                                        <div class="item-meta-date"> ${post.createTime?string('MMM d,yyyy')} </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </#list>
                <#else>
                    <div class="post-list-item">没有找到内容,请换别的关键字进行检索</div>
                </#if>
            </div>
        </div>
    </div>
    <div class="pagination clearfix">
        <#if posts.totalPages gt 1>
            <#if posts.hasPrevious()>
                <#if posts.number==1>
                    <a class="extend prev" href="${context!}/search?keyword=${keyword}">
                        <i class="fa fa-angle-left"></i>
                    </a>
                <#else>
                    <a class="extend prev" href="${context!}/search/page/${posts.number}?keyword=${keyword}">
                        <i class="fa fa-angle-left"></i>
                    </a>
                </#if>
            </#if>
            <#if (rainbow?size> 0 && rainbow[0] >= 2)>
                <a class="page-number" href="${context!}/search/page/1?keyword=${keyword}">1</a>
                <#if (rainbow[0]> 2)>
                    <span class="space">...</span>
                </#if>
            </#if>
            <#list rainbow as r>
                <#if r==posts.number+1>
                    <span class="page-number current">${r}</span>
                <#else>
                    <a class="page-number" href="${context!}/search/page/${r}?keyword=${keyword}">${r}</a>
                </#if>
            </#list>
            <#if (rainbow?size> 0 && rainbow[rainbow?size-1] < posts.totalPages)>
                    <#if (rainbow[rainbow?size-1] < posts.totalPages-1)>
                        <span class="space">...</span>
                    </#if>
                    <a class="page-number"
                        href="${context!}/search/page/${posts.totalPages}?keyword=${keyword}">${posts.totalPages}</a>
            </#if>
            <#if posts.hasNext()>
                <a class="extend next" href="${context!}/search/page/${posts.number+2}?keyword=${keyword}">
                    <i class="fa fa-angle-right"></i>
                </a>
            </#if>
        </#if>
    </div>
</div>

<#include "footer.ftl">