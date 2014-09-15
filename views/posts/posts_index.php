<?foreach( $posts as $post ):?>
    <?foreach ($tags[$post['post_id']]as $tag):?>
        <a href="#"><span class="label" style="background-color: #5bc0de"><?=$tag?></span></a>
    <?endforeach?>
    <h1><a href="<?=BASE_URL?>posts/view/<?=$posts['posts_id']?>"><?=$post['post_subject']?></a></h1>
    <p><?=$post['post_text']?></p>
    <div>
        <span class="badge">Posted 2012-08-02 20:47:04</span><div class="pull-right"><span class="label label-default">alice</span> <span class="label label-primary">story</span> <span class="label label-success">blog</span> <span class="label label-info">personal</span> <span class="label label-warning">Warning</span>
            <span class="label label-danger">Danger</span></div>
    </div>

<?endforeach?>