[[+usermenu]]
<div class="dis-profile left" style="width: 80%;">

<form action="[[~[[*id]]? &user=`[[+id]]`]]" method="post" class="dis-form" id="dis-user-edit-form" style="border: 0;">

<h2>[[+username]]</h2>
<table class="dis-table">
<tbody>
<tr>
    <th>[[%discuss.name? &namespace=`discuss` &topic=`user`]]:</th>
    <td>[[+name_first]] [[+name_last]]</td>
</tr>
<tr>
    <th>[[%discuss.posts]]</th>
    <td>[[+posts]]</td>
</tr>
<tr>
    <th>[[%discuss.ip? &namespace=`discuss` &topic=`web`]]:</th>
    <td>[[+ip]]</td>
</tr>
<tr>
    <th>[[%discuss.date_registered]]:</th>
    <td>[[+createdon:strtotime:date=`%b %d, %Y`]]</td>
</tr>
<tr>
    <th>[[%discuss.last_online]]:</th>
    <td>[[+last_active:strtotime:date=`[[++discuss.date_format]]`]]</td>
</tr>
<tr>
    <th>[[%discuss.last_reading]]:</th>
    <td><a href="[[~[[++discuss.thread_resource]]]]?thread=[[+lastThread.id]]">[[+lastThread.title]]</a></td>
</tr>
<tr>
    <td colspan="2"><hr /></td>
</tr>
<tr>
    <th>[[%discuss.email]]:</th>
    <td>[[+email]]</td>
</tr>
<tr>
    <th>[[%discuss.website]]:</th>
    <td>[[+website]]</td>
</tr>
<tr>
    <th>[[%discuss.gender]]:</th>
    <td>[[+gender]]</td>
</tr>
<tr>
    <th>[[%discuss.age]]:</th>
    <td>[[+age]]</td>
</tr>
<tr>
    <th>[[%discuss.location]]:</th>
    <td>[[+location]]</td>
</tr>
</tbody>
</table>
</form>

<br />

<ol class="dis-board-list" style="border: 0;">
    <li class="dis-category-li"><h2>[[%discuss.recent_posts? &namespace=`discuss` &topic=`web`]]</h2></li>
    [[+recentPosts]]
</ol>

</div>