<style>
    .comment-container{
        z-index: 3!important;
    }
</style>
<#macro comment post,type>
    <#if !post.disallowComment!false>
        <div class="comment-container">
            <div id="comments" class="clearfix" style="padding: 20px;">
                <script src="//cdn.jsdelivr.net/npm/vue@2.6.10/dist/vue.min.js"></script>
                <script src="//cdn.jsdelivr.net/gh/halo-dev/halo-comment@1.0.6/dist/halo-comment.min.js"></script>
                <halo-comment id="${post.id}" type="${type}"/>
            </div>
        </div>
    </#if>
</#macro>