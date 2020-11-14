function doLike(postId,userId){
	console.log(postId+" ,"+userId)
	const d={
		uid:userId,
		pid:postId,
		operation:'like'
	}
	$.ajax({
		url:"LikeServlet",
		data:d,
		success:function(data,textStatus,jqXHR){
			console.log(data);
		},
		error:function(jqXHR,textStatus,errorThrown){
			console.log(data);
		}
	})
}