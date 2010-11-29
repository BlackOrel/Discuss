<li class="dis-post" id="dis-post-[[+id]]">
    <div class="dis-post-header">
        <h3 class="dis-post-title" post="[[+id]]">[[+title]]</h3>
        <div class="dis-post-author">
            <div class="dis-post-actions">
                [[+action_remove]]
                [[+action_modify]]
                [[+action_reply]]
            </div>
            <div class="dis-author">- [[%discuss.post_author_short? &user=`[[+author.username_link]]` &date=`[[+createdon:strtotime:date=`[[++discuss.date_format]]`]]`]]</div>
            <div class="dis-author dis-hidden">
                [[+author.avatar]]
                <span class="right">
                    [[+createdon:strtotime:date=`[[++discuss.date_format]]`]]
                    <br />[[+author.email]]
                </span>
                <span>
                    [[+username]]
                    [[+author.title:notempty=`<em>[[+author.title]]</em>`]]
                    <br />
                    [[%discuss.posts]]: <span class="dis-author-post-count">[[+author.posts]]</span>
                </span>
                <br class="clear" />
                [[+author.signature:notempty=`<div class="dis-signature">[[+author.signature]]</div>`]]
            </div>
        </div>
    </div>
    <div class="dis-post-ct" id="dis-thread-ct-[[+id]]">
        <div class="dis-post-body">[[+content]]</div>
        <div class="dis-post-footer">
            <div class="dis-post-reply" id="dis-post-reply-[[+id]]">[[+action_reply]]</div>
            <div class="dis-post-attachments">
            [[+attachments:notempty=`<ul class="dis-attachments">[[+attachments]]</ul>`]]
            </div>
            <div class="dis-post-ip">
                [[+editedby:is=`0`:then=``:else=`<span class="dis-post-editedon">Edited [[+editedon:ago]] by <a href="[[~[[++discuss.user_resource]]?user=`[[+editedby]]`]]">[[+editedby.username]]</a></span>`]]
                <a href="javascript:void([[+id]]);">[[%discuss.report_to_mod]]</a>
                <a href="javascript:void([[+id]]);">[[+ip]]</a>
            </div>
        </div>
        <br class="clear" />
        [[+children:notempty=`<ol class="dis-board-thread [[+class]]">[[+children]]</ol>`]]
    </div>
</li>