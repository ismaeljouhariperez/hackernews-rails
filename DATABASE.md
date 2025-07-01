# Schéma de Base de Données - Version ASCII

Ce schéma est visible nativement dans n'importe quel éditeur de texte sans extension.

```
                         ┌─────────────────┐
                         │      USERS      │
                         ├─────────────────┤
                         │ id (PK)         │
                         │ email           │
                         │ password        │
                         │ username        │
                         └─────────┬───────┘
                                   │
                ┌──────────────────┼──────────────────┐
                │                  │                  │
                ▼                  ▼                  ▼
       ┌─────────────────┐ ┌─────────────────┐ ┌─────────────────┐
       │      POSTS      │ │    COMMENTS     │ │      VOTES      │
       ├─────────────────┤ ├─────────────────┤ ├─────────────────┤
       │ id (PK)         │ │ id (PK)         │ │ id (PK)         │
       │ title           │ │ content         │ │ user_id (FK)    │
       │ url             │ │ user_id (FK) ───┼─┤ post_id (FK)    │
       │ author          │ │ post_id (FK) ───┼─┤                 │
       │ post_type       │ └─────────┬───────┘ └─────────────────┘
       │ score           │           │
       │ hackernews_id   │           ▼
       └─────────────────┘ ┌─────────────────┐
                           │   REACTIONS     │
                           ├─────────────────┤
                           │ id (PK)         │
                           │ emoji           │
                           │ user_id (FK)    │
                           │ comment_id (FK) │
                           └─────────────────┘
```

## Relations détaillées :

```
USERS (1) ──────── (*) POSTS (via API HackerNews)
  │                     │
  │                     └─── (*) VOTES (upvotes locaux)
  │
  ├─── (*) COMMENTS (sur posts importés)
  │              │
  └──────────────└─── (*) REACTIONS (emoji sur comments)

Légende :
  (1) = Un seul
  (*) = Plusieurs
  PK  = Clé Primaire
  FK  = Clé Étrangère
```

## Tableau des relations :

```
┌─────────────────┬──────────────────┬────────────────────┐
│ Table Source    │ Clé Étrangère    │ Table Destination  │
├─────────────────┼──────────────────┼────────────────────┤
│ comments        │ user_id          │ users              │
│ comments        │ post_id          │ posts              │
│ votes           │ user_id          │ users              │
│ votes           │ post_id          │ posts              │
│ reactions       │ user_id          │ users              │
│ reactions       │ comment_id       │ comments           │
└─────────────────┴──────────────────┴────────────────────┘
```

## Structure simplifiée pour test :

```
# users
- id :integer
- email :string
- password :string
- username :string

# posts (données API HackerNews)
- id :integer
- title :string
- url :string
- author :string
- post_type :string
- score :integer
- hackernews_id :integer

# comments
- id :integer
- content :string
- user_id :integer (FK)
- post_id :integer (FK)

# votes
- id :integer
- user_id :integer (FK)
- post_id :integer (FK)

# reactions
- id :integer
- emoji :string
- user_id :integer (FK)
- comment_id :integer (FK)
```
