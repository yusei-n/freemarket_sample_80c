json.user_nickname @comment.user.nickname
json.created_at @comment.created_at.strftime('%Y/%m/%d %H:%M:%S')
json.comment @comment.comment