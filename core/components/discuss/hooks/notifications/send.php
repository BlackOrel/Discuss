<?php
/**
 * Send out all notifications for a post
 * @package discuss
 * @subpackage hooks
 */
if (empty($scriptProperties['title']) || empty($scriptProperties['thread'])) return false;

/* setup default properties */
$type = $modx->getOption('type',$scriptProperties,'post');
$subject = $modx->getOption('subject',$scriptProperties,$modx->getOption('discuss.notification_new_post_subject'));
$tpl = $modx->getOption('tpl',$scriptProperties,$modx->getOption('discuss.notification_new_post_chunk'));

/* get notification subscriptions */
$c = $modx->newQuery('dhUserNotification');
$c->where(array(
    'post' => $scriptProperties['thread'],
));
if (!empty($scriptProperties['board'])) {
    $c->orCondition(array(
        'board' => $scriptProperties['board'],
    ));
}
$notifications = $modx->getCollection('dhUserNotification',$c);
foreach ($notifications as $notification) {
    $user = $notification->getOne('User');
    if ($user == null) { $notification->remove(); continue; }
    $profile = $notification->getOne('UserProfile');
    if ($profile == null) { $notification->remove(); continue; }

    $emailProperties = $user->toArray();
    $emailProperties = array_merge($emailProperties,$profile->toArray());
    $emailProperties['tpl'] = $tpl;
    $emailProperties['name'] = $scriptProperties['title'];
    $emailProperties['url'] = $modx->makeUrl($modx->getOption('discuss.thread_resource')).'?thread='.$scriptProperties['thread'];
    $sent = $discuss->sendEmail($profile->get('email'),$user->get('username'),$subject,$emailProperties);
    unset($emailProperties);
}

return true;