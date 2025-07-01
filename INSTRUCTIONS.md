⸻

📰 HackerNews Copycat — Site à reproduire

🔗 Démo : https://hackernews-copycat-acm.osc-fr1.scalingo.io/

⸻

🎯 Fonctionnalités visibles sur la démo

Voici les comportements que tu dois implémenter, en plus de ceux indiqués dans les consignes :

🏠 Page d’accueil
• Liste de posts (titre + score)
• Lien vers le site source (via url)
• Score affiché avec un bouton ↑ pour upvote
• Nom de l’auteur du post
• Classement par score descendant

🔐 Authentification
• Inscription / Connexion / Déconnexion
• Devise avec ajout obligatoire de username

⬆️ Upvotes
• Un utilisateur connecté peut voter une seule fois par post
• Il peut retirer son vote (toggle)
• Le score se met à jour sans rechargement de la page

💬 Détail d’un post
• Affiche le titre, l’auteur, l’URL
• Liste de commentaires
• Formulaire pour ajouter un commentaire

💭 Commentaires
• Contenu texte
• Appartiennent à un User et à un Post
• S’affichent en dessous du post

😀 Réactions
• Emoji picker sur les commentaires
• Les réactions sont associées à un User et à un Comment
• Tu peux utiliser :
• emoji-mart
• ou picmo

⸻

🧱 Contraintes back-end
• Les posts viennent de l’API HackerNews : HackerNews API Docs
• Structure recommandée :
• Post (titre, url, auteur, post_type, score)
• Vote (user_id, post_id)
• Comment (content, user_id, post_id)
• Reaction (emoji, user_id, comment_id)

⸻
