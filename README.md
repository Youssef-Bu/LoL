
# 🏆 Match & Result Tracker

Une application web Ruby on Rails de gestion de matchs League of Legends.  
Elle permet de gérer les équipes, les joueurs, les matchs et les résultats dans une interface moderne et responsive.

---

## ⚙️ Fonctionnalités principales

- CRUD complet pour :
  - **Teams**
  - **Players**
  - **Matches**
  - **Results**
---
### Team
- `name:string`
- Associations :
  - has_many :players
  - has_many :matches (team_a / team_b)

### Player
- `first_name`, `last_name`, `role`, `team_id`
- appartient à une équipe

### Match
- `team_a_id`, `team_b_id`, `played_at:datetime`
- has_one :result

### Result
- `match_id`, `winner_id`, `loser_id`, `draw:boolean`, `score:string`

---
## 📁 Organisation

- **Images** : stockées dans `app/assets/images`
- **Partials** : utilisés pour réutiliser les formulaires et affichages
- **CSS personnalisé** : ajouté pour styliser les `select`, `buttons`, etc.

---

## 📦 Stack technique

- Ruby on Rails 8
- Bootstrap 5 (via CDN)
- Icons Bootstrap (CDN)
- SQLite / PostgreSQL

---

## ▶️ Lancer le projet

```
git clone https://github.com/Youssef-Bu/LoL.git
git checkout main
bundle install        # installe les gems
bin/rails db:setup    # crée la base, lance toutes les migrations, seed les données
bin/rails server      # http://127.0.0.1:3000/
```


