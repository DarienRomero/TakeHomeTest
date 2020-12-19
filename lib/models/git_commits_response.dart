// To parse this JSON data, do
//
//     final githubCommitsResponse = githubCommitsResponseFromJson(jsonString);

import 'dart:convert';

List<GithubCommitsResponse> githubCommitsResponseFromJson(String str) => List<GithubCommitsResponse>.from(json.decode(str).map((x) => GithubCommitsResponse.fromJson(x)));

String githubCommitsResponseToJson(List<GithubCommitsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GithubCommitsResponse {
    GithubCommitsResponse({
        this.sha,
        this.nodeId,
        this.commit,
        this.url,
        this.htmlUrl,
        this.commentsUrl,
        this.author,
        this.committer,
        this.parents,
    });

    String sha;
    String nodeId;
    Commit commit;
    String url;
    String htmlUrl;
    String commentsUrl;
    GithubCommitsResponseAuthor author;
    GithubCommitsResponseAuthor committer;
    List<dynamic> parents;

    factory GithubCommitsResponse.fromJson(Map<String, dynamic> json) => GithubCommitsResponse(
        sha: json["sha"],
        nodeId: json["node_id"],
        commit: Commit.fromJson(json["commit"]),
        url: json["url"],
        htmlUrl: json["html_url"],
        commentsUrl: json["comments_url"],
        author: GithubCommitsResponseAuthor.fromJson(json["author"]),
        committer: GithubCommitsResponseAuthor.fromJson(json["committer"]),
        parents: List<dynamic>.from(json["parents"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "sha": sha,
        "node_id": nodeId,
        "commit": commit.toJson(),
        "url": url,
        "html_url": htmlUrl,
        "comments_url": commentsUrl,
        "author": author.toJson(),
        "committer": committer.toJson(),
        "parents": List<dynamic>.from(parents.map((x) => x)),
    };
}

class GithubCommitsResponseAuthor {
    GithubCommitsResponseAuthor({
        this.login,
        this.id,
        this.nodeId,
        this.avatarUrl,
        this.gravatarId,
        this.url,
        this.htmlUrl,
        this.followersUrl,
        this.followingUrl,
        this.gistsUrl,
        this.starredUrl,
        this.subscriptionsUrl,
        this.organizationsUrl,
        this.reposUrl,
        this.eventsUrl,
        this.receivedEventsUrl,
        this.type,
        this.siteAdmin,
    });

    String login;
    int id;
    String nodeId;
    String avatarUrl;
    String gravatarId;
    String url;
    String htmlUrl;
    String followersUrl;
    String followingUrl;
    String gistsUrl;
    String starredUrl;
    String subscriptionsUrl;
    String organizationsUrl;
    String reposUrl;
    String eventsUrl;
    String receivedEventsUrl;
    String type;
    bool siteAdmin;

    factory GithubCommitsResponseAuthor.fromJson(Map<String, dynamic> json) => GithubCommitsResponseAuthor(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        gistsUrl: json["gists_url"],
        starredUrl: json["starred_url"],
        subscriptionsUrl: json["subscriptions_url"],
        organizationsUrl: json["organizations_url"],
        reposUrl: json["repos_url"],
        eventsUrl: json["events_url"],
        receivedEventsUrl: json["received_events_url"],
        type: json["type"],
        siteAdmin: json["site_admin"],
    );

    Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "gists_url": gistsUrl,
        "starred_url": starredUrl,
        "subscriptions_url": subscriptionsUrl,
        "organizations_url": organizationsUrl,
        "repos_url": reposUrl,
        "events_url": eventsUrl,
        "received_events_url": receivedEventsUrl,
        "type": type,
        "site_admin": siteAdmin,
    };
}

class Commit {
    Commit({
        this.author,
        this.committer,
        this.message,
        this.tree,
        this.url,
        this.commentCount,
        this.verification,
    });

    CommitAuthor author;
    CommitAuthor committer;
    String message;
    Tree tree;
    String url;
    int commentCount;
    Verification verification;

    factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        author: CommitAuthor.fromJson(json["author"]),
        committer: CommitAuthor.fromJson(json["committer"]),
        message: json["message"],
        tree: Tree.fromJson(json["tree"]),
        url: json["url"],
        commentCount: json["comment_count"],
        verification: Verification.fromJson(json["verification"]),
    );

    Map<String, dynamic> toJson() => {
        "author": author.toJson(),
        "committer": committer.toJson(),
        "message": message,
        "tree": tree.toJson(),
        "url": url,
        "comment_count": commentCount,
        "verification": verification.toJson(),
    };
}

class CommitAuthor {
    CommitAuthor({
        this.name,
        this.email,
        this.date,
    });

    String name;
    String email;
    DateTime date;

    factory CommitAuthor.fromJson(Map<String, dynamic> json) => CommitAuthor(
        name: json["name"],
        email: json["email"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "date": date.toIso8601String(),
    };
}

class Tree {
    Tree({
        this.sha,
        this.url,
    });

    String sha;
    String url;

    factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        sha: json["sha"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "sha": sha,
        "url": url,
    };
}

class Verification {
    Verification({
        this.verified,
        this.reason,
        this.signature,
        this.payload,
    });

    bool verified;
    String reason;
    dynamic signature;
    dynamic payload;

    factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        verified: json["verified"],
        reason: json["reason"],
        signature: json["signature"],
        payload: json["payload"],
    );

    Map<String, dynamic> toJson() => {
        "verified": verified,
        "reason": reason,
        "signature": signature,
        "payload": payload,
    };
}