<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
    <title>Nour</title>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
    <meta name="theme-color" content="#1a2e28">
    <meta name="apple-mobile-web-app-title" content="Nour">
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400;600&family=Lato:wght@300;400;700&display=swap" rel="stylesheet">

    <style>
/* --- DESIGN SYSTEM "NOUR - TOTAL BLACK" --- */
:root {
    --bg-deep: #050a08;     /* Noir profond */
    --primary: #4e8c75;     /* Vert élégant */
    --accent: #d4af37;      /* Doré */
    --text-main: #f0f0f0;   /* Blanc cassé */
    --text-muted: #aaaaaa;  /* Gris */
    
    /* STYLE VERRE (GLASSMORPHISM) */
    --glass-bg: rgba(20, 30, 25, 0.7); 
    --glass-border: rgba(212, 175, 55, 0.25);
    --glass-blur: blur(12px);

    /* POLICES */
    --font-title: 'Cinzel', serif;
    --font-body: 'Lato', sans-serif;
}

* { box-sizing: border-box; -webkit-tap-highlight-color: transparent; }

body {
    font-family: var(--font-body);
    background-color: var(--bg-deep);
    color: var(--text-main);
    margin: 0; padding: 0; height: 100vh;
    display: flex; flex-direction: column; overflow: hidden;
}

/* --- FOND ANIMÉ --- */
.animated-background {
    position: fixed; top: 0; left: 0; width: 100%; height: 100%; z-index: -1;
    background: radial-gradient(circle at bottom center, #1b2e28 0%, #000000 100%);
}
.animated-background span {
    position: absolute; display: block; width: 20px; height: 20px; background: var(--accent);
    border-radius: 50%; opacity: 0; animation: animate 25s linear infinite; bottom: -150px;
    box-shadow: 0 0 20px var(--accent);
}
.animated-background span:nth-child(1) { left: 25%; width: 30px; height: 30px; animation-duration: 20s; opacity: 0.2; }
.animated-background span:nth-child(2) { left: 10%; width: 10px; height: 10px; animation-delay: 2s; animation-duration: 25s; opacity: 0.3; }
.animated-background span:nth-child(3) { left: 70%; width: 20px; height: 20px; animation-delay: 4s; animation-duration: 18s; opacity: 0.15; }
.animated-background span:nth-child(4) { left: 40%; width: 40px; height: 40px; animation-duration: 22s; opacity: 0.1; }
@keyframes animate {
    0% { transform: translateY(0) rotate(0deg); opacity: 0; }
    50% { opacity: 0.4; }
    100% { transform: translateY(-120vh) rotate(720deg); opacity: 0; }
}

/* --- ÉCRANS --- */
.screen {
    display: none; flex-direction: column; height: 100%; width: 100%;
    position: absolute; top: 0; left: 0; overflow-y: auto;
    background: transparent; -webkit-overflow-scrolling: touch;
}
.active { display: flex; }
@keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }
.fade-in { animation: fadeIn 0.5s ease-out forwards; }

/* --- ACCUEIL --- */
#screen-home { justify-content: center; align-items: center; text-align: center; padding: 40px 20px; }
.logo-circle {
    width: 90px; height: 90px; border: 2px solid var(--accent); border-radius: 50%;
    display: flex; align-items: center; justify-content: center; margin: 0 auto 20px auto;
    font-size: 2.5rem; color: var(--accent); background: rgba(0,0,0,0.3);
}
h1 { font-family: var(--font-title); font-size: 3.5rem; margin: 0; color: #fff; text-shadow: 0 5px 15px rgba(0,0,0,0.5); }
.subtitle { font-size: 1rem; text-transform: uppercase; letter-spacing: 5px; color: var(--accent); margin-top: 10px; opacity: 0.8; }

/* --- CARTE DU JOUR --- */
.daily-card {
    background: var(--glass-bg); border: 1px solid var(--glass-border);
    border-radius: 20px; padding: 25px; margin: 20px 10px; text-align: center;
    backdrop-filter: var(--glass-blur);
}
.daily-label { font-size: 0.75rem; color: var(--accent); font-weight: bold; letter-spacing: 2px; margin-bottom: 10px; }
#daily-hadith-text { font-family: var(--font-title); font-size: 1.1rem; line-height: 1.6; color: #fff; font-style: italic; }
.daily-source { font-size: 0.85rem; color: var(--text-muted); margin-top: 10px; }

/* --- BOUTONS --- */
.btn-enter {
    background: linear-gradient(135deg, var(--accent), #b88a2d);
    color: #000; padding: 16px 0; width: 100%; border: none; border-radius: 50px;
    font-size: 1rem; font-weight: 700; letter-spacing: 1px; cursor: pointer; margin-bottom: 15px;
    box-shadow: 0 0 20px rgba(212, 175, 55, 0.3);
}
.btn-back { background: none; border: none; font-size: 1rem; color: var(--accent); font-weight: bold; cursor: pointer; }

/* --- DASHBOARD --- */
.dashboard-grid { padding: 20px; display: flex; flex-direction: column; gap: 20px; }
.dash-card, .menu-card {
    background: var(--glass-bg); backdrop-filter: var(--glass-blur);
    border: 1px solid rgba(255,255,255,0.1); padding: 25px; border-radius: 20px;
    display: flex; align-items: center; cursor: pointer;
}
.dash-icon, .menu-icon { font-size: 2rem; margin-right: 20px; color: var(--accent); }
.dash-content h3, .menu-title { margin: 0; color: #fff; font-family: var(--font-title); font-size: 1.2rem; }
.dash-content p { margin: 5px 0 0 0; color: var(--text-muted); font-size: 0.9rem; }
.dash-arrow { color: var(--accent); font-size: 1.5rem; margin-left: auto; }

/* --- LISTE HADITHS (Le correctif est ici) --- */
.hadith-container { padding: 20px; }
.hadith-card {
    background: var(--glass-bg);
    backdrop-filter: var(--glass-blur);
    border: 1px solid var(--glass-border);
    border-radius: 16px;
    padding: 25px;
    margin-bottom: 20px;
    position: relative;
}
.tag { font-size: 0.7rem; color: var(--accent); text-transform: uppercase; display: block; margin-bottom: 10px; }
.hadith-text { font-family: var(--font-title); font-size: 1.15rem; line-height: 1.6; color: #fff; margin-bottom: 20px; }
.hadith-source { font-size: 0.85rem; color: var(--text-muted); text-align: right; font-style: italic; }

/* --- NAVIGATION --- */
.top-bar { 
    display: flex; align-items: center; justify-content: space-between; 
    padding: 20px; background: rgba(0,0,0,0.3); backdrop-filter: blur(10px);
}
.nav-header { text-align: center; padding: 20px; }
.nav-header h2 { font-family: var(--font-title); font-size: 2rem; color: #fff; margin: 0; }
.search-area { padding: 10px 20px; }
input, select {
    width: 100%; padding: 15px; background: rgba(255,255,255,0.1); border: 1px solid rgba(255,255,255,0.1);
    border-radius: 12px; color: #fff; margin-bottom: 10px; font-size: 1rem;
}

/* --- QUIZ (Le correctif est ici) --- */
#options-container {
    display: flex; flex-direction: column; gap: 15px; width: 100%; margin-top: 30px;
}
.option-btn {
    width: 100%; padding: 20px;
    background: rgba(255, 255, 255, 0.08);
    border: 1px solid rgba(255, 255, 255, 0.15);
    border-radius: 15px;
    color: #fff; font-size: 1.1rem; text-align: left;
    cursor: pointer; transition: background 0.2s;
    font-family: var(--font-body);
}
.option-btn:active { background: rgba(255,255,255,0.2); }
.correct { background-color: rgba(46, 204, 113, 0.4) !important; border-color: #2ecc71 !important; }
.wrong { background-color: rgba(231, 76, 60, 0.4) !important; border-color: #e74c3c !important; }

#question-text { font-family: var(--font-title); font-size: 1.4rem; text-align: center; color: #fff; line-height: 1.5; }
.score-circle {
    width: 120px; height: 120px; border-radius: 50%; background: var(--accent); color: #000;
    display: flex; align-items: center; justify-content: center; margin: 0 auto 20px auto;
    font-size: 2.5rem; font-weight: bold;
}

/* Footer */
.footer-count { position: absolute; bottom: 20px; width: 100%; text-align: center; color: rgba(255,255,255,0.3); font-size: 0.8rem; }
        


       
    </style>
</head>
<body>

    <script>
/* =========================================
   PARTIE 1 : LA BASE DE DONNÉES (DATA)
   Colle tes 1000 Hadiths ici
   ========================================= */

let hadiths = [
    // --- BATCH 1 ---
    { sujet: "Intention", texte: "Les actes ne valent que par les intentions.", source: "Bukhari & Muslim" },
    { sujet: "Famille", texte: "Le paradis se trouve sous les pieds des mères.", source: "An-Nasa'i" },
  // --- PACK 1 : LES FONDAMENTAUX ---
    { sujet: "Intention", texte: "Les actes ne valent que par les intentions.", source: "Bukhari & Muslim" },
    { sujet: "Mère", texte: "Le Paradis se trouve sous les pieds des mères.", source: "An-Nasa'i" },
    { sujet: "Colère", texte: "Le fort n'est pas celui qui terrasse ses adversaires, mais celui qui se maîtrise lors de la colère.", source: "Bukhari" },
    { sujet: "Fraternité", texte: "Nul d'entre vous ne sera véritablement croyant tant qu'il n'aimera pas pour son frère ce qu'il aime pour lui-même.", source: "Bukhari & Muslim" },
    { sujet: "Sourire", texte: "Sourire à ton frère est une aumône.", source: "At-Tirmidhi" },
    { sujet: "Savoir", texte: "Celui qui emprunte un chemin à la recherche du savoir, Allah lui facilite un chemin vers le Paradis.", source: "Muslim" },
    { sujet: "Patience", texte: "L'affaire du croyant est étonnante : tout est bien pour lui. S'il lui arrive un bonheur il remercie, s'il lui arrive un malheur il patiente.", source: "Muslim" },
    { sujet: "Utilité", texte: "La meilleure des personnes est celle qui est la plus utile aux autres.", source: "At-Tabarani" },
    { sujet: "Vérité", texte: "Dis la vérité, même si elle est amère.", source: "Ahmed" },
    { sujet: "Famille", texte: "Le meilleur d'entre vous est celui qui est le meilleur avec sa famille.", source: "At-Tirmidhi" },
    { sujet: "Parole", texte: "Que celui qui croit en Allah et au Jour Dernier dise du bien ou qu'il se taise.", source: "Bukhari & Muslim" },
    { sujet: "Pudeur", texte: "La pudeur ne vient qu'avec le bien.", source: "Bukhari & Muslim" },
    { sujet: "Pardon", texte: "Crains Allah où que tu sois, fais suivre la mauvaise action par une bonne qui l'effacera, et comporte-toi avec les gens de belle manière.", source: "At-Tirmidhi" },
    { sujet: "Voisin", texte: "Par Allah, il n'est pas croyant celui dont le voisin n'est pas à l'abri de ses méfaits.", source: "Bukhari" },
    { sujet: "Cadeau", texte: "Faites-vous des cadeaux, vous vous aimerez.", source: "Al-Bukhari (Adab)" },
    { sujet: "Main", texte: "La main supérieure (qui donne) est meilleure que la main inférieure (qui reçoit).", source: "Bukhari" },
    { sujet: "Prière", texte: "La première chose sur laquelle le serviteur sera jugé le Jour de la Résurrection est la prière.", source: "At-Tirmidhi" },
    { sujet: "Pureté", texte: "La pureté est la moitié de la foi.", source: "Muslim" },
    { sujet: "Mosquée", texte: "Celui qui bâtit une mosquée pour Allah, Allah lui bâtit une maison au Paradis.", source: "Bukhari & Muslim" },
    { sujet: "Repentir", texte: "Tous les fils d'Adam commettent des péchés, et les meilleurs des pécheurs sont ceux qui se repentent.", source: "At-Tirmidhi" },
    { sujet: "Doux", texte: "Allah est Doux et Il aime la douceur en toute chose.", source: "Bukhari & Muslim" },
    { sujet: "Santé", texte: "Il y a deux bienfaits que beaucoup de gens négligent : la santé et le temps libre.", source: "Bukhari" },
    { sujet: "Manger", texte: "Le fils d'Adam ne remplit pas de récipient pire que son ventre.", source: "At-Tirmidhi" },
    { sujet: "Savants", texte: "Les savants sont les héritiers des prophètes.", source: "Abu Dawud" },
    { sujet: "Patience", texte: "La vraie patience est celle qui se manifeste au premier choc.", source: "Bukhari" },
    { sujet: "Jalousie", texte: "Méfiez-vous de la jalousie, car elle consume les bonnes actions comme le feu consume le bois.", source: "Abu Dawud" },
    { sujet: "Salutation", texte: "Vous n'entrerez pas au Paradis tant que vous ne croirez pas, et vous ne croirez pas tant que vous ne vous aimerez pas. Voulez-vous que je vous indique une chose qui vous fera vous aimer ? Répondez le Salam entre vous.", source: "Muslim" },
    { sujet: "Propreté", texte: "Si je ne craignais pas de surcharger ma communauté, je leur aurais ordonné le Siwak (brossage de dents) avant chaque prière.", source: "Bukhari & Muslim" },
    { sujet: "Orphelin", texte: "Moi et celui qui prend en charge un orphelin serons au Paradis comme ces deux-là (il montra son index et son majeur).", source: "Bukhari" },
    { sujet: "Dette", texte: "L'âme du croyant est suspendue à sa dette jusqu'à ce qu'elle soit acquittée.", source: "At-Tirmidhi" },
    { sujet: "Mort", texte: "Vivez dans ce monde comme si vous étiez un étranger ou un voyageur.", source: "Bukhari" },
    { sujet: "Hypocrite", texte: "Les signes de l'hypocrite sont trois : quand il parle il ment, quand il promet il ne tient pas parole, et quand on lui confie un dépôt il trahit.", source: "Bukhari & Muslim" },
    { sujet: "Miséricorde", texte: "Ceux qui sont miséricordieux, le Tout-Miséricordieux leur fera miséricorde.", source: "At-Tirmidhi" },
    { sujet: "Force", texte: "Le croyant fort est meilleur et plus aimé d'Allah que le croyant faible, et en tous deux il y a du bien.", source: "Muslim" },
    { sujet: "Dhikr", texte: "L'image de celui qui évoque son Seigneur et de celui qui ne l'évoque pas est comme celle du vivant et du mort.", source: "Bukhari" },
    { sujet: "Amis", texte: "L'homme a la même religion que son ami intime, que chacun de vous regarde donc qui il prend pour ami.", source: "Abu Dawud" },
    { sujet: "Justice", texte: "Craignez l'invocation de l'opprimé, même s'il est mécréant, car il n'y a pas de voile entre elle et Allah.", source: "Ahmed" },
    { sujet: "Bien", texte: "Celui qui indique le bien a la même récompense que celui qui l'accomplit.", source: "Muslim" },
    { sujet: "Animal", texte: "Une femme est entrée en Enfer à cause d'une chatte qu'elle avait enfermée sans la nourrir.", source: "Bukhari" },
    { sujet: "Animal", texte: "En tout être vivant (à qui l'on donne à boire), il y a une récompense.", source: "Bukhari" },
    { sujet: "Coran", texte: "Le meilleur d'entre vous est celui qui apprend le Coran et l'enseigne.", source: "Bukhari" },
    { sujet: "Coran", texte: "Lisez le Coran, car il viendra le Jour de la Résurrection comme intercesseur pour les siens.", source: "Muslim" },
    { sujet: "Vendredi", texte: "Le meilleur jour sur lequel le soleil s'est levé est le vendredi.", source: "Muslim" },
    { sujet: "Voyage", texte: "L'invocation du voyageur est exaucée.", source: "At-Tirmidhi" },
    { sujet: "Sincérité", texte: "Allah ne regarde ni vos corps ni vos images, mais Il regarde vos cœurs et vos actes.", source: "Muslim" },
    { sujet: "Protection", texte: "Celui qui prie la prière du matin (Fajr) est sous la protection d'Allah.", source: "Muslim" },
    { sujet: "Richesse", texte: "La richesse ne dépend pas de la quantité de biens, mais la vraie richesse est celle de l'âme.", source: "Bukhari" },
    { sujet: "Insulte", texte: "Insulter un musulman est de la perversité et le combattre est de la mécréance.", source: "Bukhari & Muslim" },
    { sujet: "Guerre", texte: "Ne souhaitez pas la rencontre de l'ennemi, mais si vous le rencontrez, soyez patients (fermes).", source: "Bukhari & Muslim" },
    { sujet: "Temps", texte: "Profite de cinq choses avant cinq autres : ta jeunesse avant ta vieillesse, ta santé avant ta maladie, ta richesse avant ta pauvreté, ton temps libre avant ton occupation et ta vie avant ta mort.", source: "Al-Hakim" },
  // --- PACK 2 : ÉTHIQUE ET SAGESSE ---
    { sujet: "Médisance", texte: "Savez-vous ce qu'est la médisance ? C'est mentionner ton frère par ce qu'il déteste.", source: "Muslim" },
    { sujet: "Espionnage", texte: "Ne vous espionnez pas les uns les autres et ne vous cherchez pas les défauts.", source: "Bukhari & Muslim" },
    { sujet: "Amour", texte: "L'homme sera avec ceux qu'il a aimés (au Jour du Jugement).", source: "Bukhari" },
    { sujet: "Père", texte: "La satisfaction d'Allah se trouve dans la satisfaction du père, et la colère d'Allah dans la colère du père.", source: "At-Tirmidhi" },
    { sujet: "Femmes", texte: "Je vous recommande le bien envers les femmes.", source: "Bukhari & Muslim" },
    { sujet: "Confiance", texte: "Si vous vous en remettiez à Allah comme Il le mérite, Il vous nourrirait comme Il nourrit les oiseaux.", source: "At-Tirmidhi" },
    { sujet: "Enfer", texte: "Protégez-vous du Feu, ne serait-ce qu'avec la moitié d'une datte (donnée en aumône).", source: "Bukhari & Muslim" },
    { sujet: "Beauté", texte: "Allah est Beau et Il aime la beauté.", source: "Muslim" },
    { sujet: "Droits", texte: "Donne à chaque ayant-droit son droit.", source: "Bukhari" },
    { sujet: "Sommeil", texte: "Lorsque tu vas te coucher, fais tes ablutions comme pour la prière.", source: "Bukhari & Muslim" },
    { sujet: "Éternuement", texte: "Si l'un de vous éternue, qu'il dise 'Alhamdulillah' (Louange à Allah).", source: "Bukhari" },
    { sujet: "Promesse", texte: "Le croyant n'est pas un grand parleur, ni un insulteur, ni grossier ou obscène.", source: "At-Tirmidhi" },
    { sujet: "Rupture", texte: "Il n'est pas permis à un musulman de fuir son frère plus de trois jours.", source: "Bukhari & Muslim" },
    { sujet: "Honneur", texte: "Tout le musulman est sacré pour le musulman : son sang, ses biens et son honneur.", source: "Muslim" },
    { sujet: "Facilité", texte: "La religion est facilité. Personne ne rend la religion difficile sans qu'elle ne le vainque.", source: "Bukhari" },
    { sujet: "Modestie", texte: "Celui qui se fait humble pour Allah, Allah l'élève.", source: "Muslim" },
    { sujet: "Doute", texte: "Laisse ce qui te fait douter pour ce qui ne te fait pas douter.", source: "At-Tirmidhi" },
    { sujet: "Matin", texte: "Ô Allah, bénis ma communauté dans son départ matinal (ses activités du matin).", source: "Abu Dawud" },
    { sujet: "Silence", texte: "Celui qui garde le silence est sauvé.", source: "At-Tirmidhi" },
    { sujet: "Gaspillage", texte: "Mangez, buvez, donnez l'aumône et habillez-vous, sans excès ni orgueil.", source: "An-Nasa'i" },
    { sujet: "Visite", texte: "Celui qui rend visite à un malade ou à un frère en Allah, un appelant lui crie : 'Tu as bien fait, ta marche est bénie et tu as préparé une demeure au Paradis'.", source: "At-Tirmidhi" },
    { sujet: "Jeûne", texte: "Le jeûne est une protection (contre le péché et le Feu).", source: "Bukhari & Muslim" },
    { sujet: "Invocation", texte: "L'invocation est l'adoration même.", source: "Abu Dawud" },
    { sujet: "Péché", texte: "Le péché est ce qui trouble ton âme et que tu détesterais que les gens découvrent.", source: "Muslim" },
    { sujet: "Honte", texte: "Si tu n'as pas de pudeur, fais ce que tu veux.", source: "Bukhari" },
    { sujet: "Chemin", texte: "La foi comporte soixante-dix et quelques branches... la moindre est d'écarter ce qui nuit du chemin.", source: "Muslim" },
    { sujet: "Martyr", texte: "Celui qui meurt en défendant ses biens est un martyr.", source: "Bukhari & Muslim" },
    { sujet: "Manger", texte: "La nourriture de deux suffit à trois, et la nourriture de trois suffit à quatre.", source: "Bukhari & Muslim" },
    { sujet: "Salutation", texte: "Le cavalier salue le piéton, le piéton salue celui qui est assis, et le petit groupe salue le grand groupe.", source: "Bukhari" },
    { sujet: "Regard", texte: "Le regard (illicite) est une des flèches empoisonnées d'Iblis.", source: "Al-Hakim" },
    { sujet: "Colère", texte: "Si l'un de vous se met en colère alors qu'il est debout, qu'il s'asseye.", source: "Abu Dawud" },
    { sujet: "Richesse", texte: "Ô fils d'Adam ! Si tu donnes ton surplus, c'est mieux pour toi, et si tu le gardes, c'est un mal pour toi.", source: "Muslim" },
    { sujet: "Mort", texte: "Hâtez-vous de faire de bonnes actions avant que ne surviennent sept choses (la mort, la maladie, etc.).", source: "At-Tirmidhi" },
    { sujet: "Enfants", texte: "Soyez équitables envers vos enfants (dans les dons).", source: "Bukhari & Muslim" },
    { sujet: "Cœur", texte: "Certes, il y a dans le corps un morceau de chair : s'il est sain, tout le corps est sain, et s'il est corrompu, tout le corps est corrompu. C'est le cœur.", source: "Bukhari & Muslim" },
    { sujet: "Dettes", texte: "Le meilleur d'entre vous est celui qui règle ses dettes de la meilleure manière.", source: "Bukhari" },
    { sujet: "Aumône", texte: "L'aumône cachée éteint la colère du Seigneur.", source: "At-Tabarani" },
    { sujet: "Prière", texte: "Celui qui a manqué la prière de l'Asr, c'est comme s'il avait perdu sa famille et ses biens.", source: "Bukhari" },
    { sujet: "Vendredi", texte: "Il y a en ce jour (vendredi) une heure durant laquelle aucun serviteur musulman ne demande quelque chose à Allah sans qu'Il ne la lui accorde.", source: "Bukhari & Muslim" },
    { sujet: "Science", texte: "Un seul savant face au Diable est plus redoutable que mille adorateurs ignorants.", source: "At-Tirmidhi" },
    { sujet: "Bienfait", texte: "Celui qui ne remercie pas les gens ne remercie pas Allah.", source: "Abu Dawud" },
    { sujet: "Coran", texte: "On dira au lecteur du Coran (le jour du Jugement) : Lis et monte, et récite comme tu récitais dans le bas-monde.", source: "Abu Dawud" },
    { sujet: "Avenir", texte: "Profite de ta vie avant ta mort.", source: "Al-Hakim" },
    { sujet: "Respect", texte: "Ne fait pas partie de nous celui qui ne respecte pas nos aînés et ne fait pas miséricorde à nos petits.", source: "At-Tirmidhi" },
    { sujet: "Patience", texte: "La patience est une lumière.", source: "Muslim" },
    { sujet: "Abolition", texte: "Suis le chemin droit, approche-toi de la perfection et annonce la bonne nouvelle.", source: "Bukhari" },
    { sujet: "Justice", texte: "Allah torture ceux qui torturent les gens dans ce monde.", source: "Muslim" },
    { sujet: "Chien", texte: "Si le chien boit dans le récipient de l'un de vous, qu'il le lave sept fois.", source: "Bukhari & Muslim" },
    { sujet: "Commerce", texte: "Le serment (pour vendre) écoule la marchandise mais efface la bénédiction.", source: "Bukhari & Muslim" },
    { sujet: "Paradis", texte: "Le Paradis est entouré de désagréments (épreuves) et l'Enfer est entouré de désirs.", source: "Muslim" },
  // --- PACK 3 : 100 HADITHS (LE GRAND SAUT) ---
    { sujet: "Foi", texte: "J'ai cru en Allah, puis je me suis tenu droit.", source: "Muslim" },
    { sujet: "Ablutions", texte: "Celui qui fait ses ablutions parfaitement, ses péchés sortent de son corps.", source: "Muslim" },
    { sujet: "Siwak", texte: "Le Siwak purifie la bouche et satisfait le Seigneur.", source: "Bukhari" },
    { sujet: "Prière", texte: "La prière est une lumière.", source: "Muslim" },
    { sujet: "Mosquée", texte: "Les endroits les plus aimés d'Allah sont les mosquées.", source: "Muslim" },
    { sujet: "Aumône", texte: "L'aumône éteint le péché comme l'eau éteint le feu.", source: "At-Tirmidhi" },
    { sujet: "Jeûne", texte: "L'odeur de la bouche du jeûneur est plus agréable à Allah que l'odeur du musc.", source: "Bukhari & Muslim" },
    { sujet: "Hajj", texte: "Le Pèlerinage accepté n'a d'autre récompense que le Paradis.", source: "Bukhari & Muslim" },
    { sujet: "Invocation", texte: "L'invocation est l'arme du croyant.", source: "Al-Hakim" },
    { sujet: "Salutation", texte: "Répandez le Salam (la paix) entre vous.", source: "Muslim" },
    { sujet: "Voisin", texte: "Celui qui croit en Allah et au Jour dernier, qu'il honore son voisin.", source: "Bukhari & Muslim" },
    { sujet: "Invité", texte: "Celui qui croit en Allah et au Jour dernier, qu'il honore son invité.", source: "Bukhari & Muslim" },
    { sujet: "Parole", texte: "Une bonne parole est une aumône.", source: "Bukhari & Muslim" },
    { sujet: "Silence", texte: "Celui qui se tait est sauvé.", source: "At-Tirmidhi" },
    { sujet: "Colère", texte: "Ne te mets pas en colère, et tu auras le Paradis.", source: "At-Tabarani" },
    { sujet: "Pudeur", texte: "La pudeur fait partie de la foi.", source: "Bukhari & Muslim" },
    { sujet: "Douceur", texte: "La douceur n'est pas dans une chose sans l'embellir.", source: "Muslim" },
    { sujet: "Patience", texte: "La patience est une clarté.", source: "Muslim" },
    { sujet: "Gratitude", texte: "Celui qui ne remercie pas les gens ne remercie pas Allah.", source: "At-Tirmidhi" },
    { sujet: "Repentir", texte: "Le repentir efface ce qui précède.", source: "Ahmed" },
    { sujet: "Miséricorde", texte: "Faites miséricorde à ceux qui sont sur terre, Celui qui est au ciel vous fera miséricorde.", source: "At-Tirmidhi" },
    { sujet: "Justice", texte: "L'injustice sera des ténèbres le Jour de la Résurrection.", source: "Bukhari & Muslim" },
    { sujet: "Mensonge", texte: "Le mensonge mène à la perversité et la perversité mène à l'Enfer.", source: "Bukhari & Muslim" },
    { sujet: "Promesse", texte: "Le respect de l'engagement fait partie de la foi.", source: "Al-Hakim" },
    { sujet: "Hypocrisie", texte: "Le pire des gens est celui qui a deux visages.", source: "Bukhari & Muslim" },
    { sujet: "Orgueil", texte: "La grandeur est Mon manteau, celui qui Me le dispute, Je le châtie.", source: "Muslim" },
    { sujet: "Jalousie", texte: "Ne vous jalousez pas.", source: "Bukhari & Muslim" },
    { sujet: "Haine", texte: "Ne vous haïssez pas.", source: "Bukhari & Muslim" },
    { sujet: "Rupture", texte: "Ne vous tournez pas le dos les uns aux autres.", source: "Bukhari & Muslim" },
    { sujet: "Espionnage", texte: "Ne cherchez pas les défauts des autres.", source: "Bukhari & Muslim" },
    { sujet: "Suspicion", texte: "Méfiez-vous de la suspicion, car c'est la parole la plus mensongère.", source: "Bukhari & Muslim" },
    { sujet: "Médisance", texte: "Ton sang, tes biens et ton honneur sont sacrés.", source: "Muslim" },
    { sujet: "Famille", texte: "Le lien de parenté est suspendu au Trône.", source: "Bukhari & Muslim" },
    { sujet: "Parents", texte: "Le paradis est sous les pieds des mères.", source: "An-Nasa'i" },
    { sujet: "Père", texte: "Le père est la porte du milieu du Paradis.", source: "At-Tirmidhi" },
    { sujet: "Orphelin", texte: "Je serai avec celui qui parraine l'orphelin au Paradis ainsi (index et majeur).", source: "Bukhari" },
    { sujet: "Femme", texte: "Le meilleur d'entre vous est le meilleur avec ses femmes.", source: "At-Tirmidhi" },
    { sujet: "Mari", texte: "Si je devais ordonner à quelqu'un de se prosterner devant un autre, j'ordonnerais à la femme de se prosterner devant son mari.", source: "At-Tirmidhi" },
    { sujet: "Enfants", texte: "Soyez justes envers vos enfants.", source: "Bukhari & Muslim" },
    { sujet: "Malade", texte: "Visitez le malade.", source: "Bukhari" },
    { sujet: "Mort", texte: "Rappelez-vous souvent de la destructrice des plaisirs (la mort).", source: "At-Tirmidhi" },
    { sujet: "Funérailles", texte: "Suivez les convois funèbres.", source: "Bukhari" },
    { sujet: "Tombe", texte: "La tombe est la première étape de l'Au-delà.", source: "At-Tirmidhi" },
    { sujet: "Martyr", texte: "Celui qui demande sincèrement le martyre, Allah l'élève au rang des martyrs même s'il meurt dans son lit.", source: "Muslim" },
    { sujet: "Intention", texte: "Allah n'accepte de l'acte que ce qui est sincère et par lequel on cherche Son Visage.", source: "An-Nasa'i" },
    { sujet: "Innovation", texte: "Toute innovation est égarement.", source: "Muslim" },
    { sujet: "Suivi", texte: "Tenez-vous à ma Sunna.", source: "Abu Dawud" },
    { sujet: "Savoir", texte: "La recherche de la science est une obligation pour tout musulman.", source: "Ibn Majah" },
    { sujet: "Ignorance", texte: "Allah ne reprend pas la science en l'arrachant aux gens, mais en reprenant les savants.", source: "Bukhari & Muslim" },
    { sujet: "Travail", texte: "Allah aime que lorsqu'un de vous fait un travail, il le perfectionne.", source: "Al-Bayhaqi" },
    { sujet: "Commerce", texte: "Le vendeur et l'acheteur ont le choix tant qu'ils ne se sont pas séparés.", source: "Bukhari & Muslim" },
    { sujet: "Dette", texte: "Le martyr est pardonné de tout péché sauf la dette.", source: "Muslim" },
    { sujet: "Usure", texte: "Allah a maudit celui qui mange l'usure (Riba).", source: "Muslim" },
    { sujet: "Manger", texte: "Mange de ce qui est devant toi.", source: "Bukhari & Muslim" },
    { sujet: "Boire", texte: "Ne buvez pas debout.", source: "Muslim" },
    { sujet: "Vêtement", texte: "Celui qui traîne son vêtement par orgueil, Allah ne le regardera pas.", source: "Bukhari & Muslim" },
    { sujet: "Or", texte: "L'or et la soie sont licites aux femmes de ma communauté et illicites aux hommes.", source: "At-Tirmidhi" },
    { sujet: "Sommeil", texte: "Dors sur ton flanc droit.", source: "Bukhari & Muslim" },
    { sujet: "Réveil", texte: "Louange à Allah qui nous a rendu la vie après nous avoir fait mourir.", source: "Bukhari" },
    { sujet: "Voyage", texte: "Le voyage est un fragment du châtiment.", source: "Bukhari & Muslim" },
    { sujet: "Monture", texte: "Craignez Allah concernant ces animaux muets.", source: "Abu Dawud" },
    { sujet: "Chien", texte: "Les anges n'entrent pas dans une maison où il y a un chien ou une image.", source: "Bukhari & Muslim" },
    { sujet: "Chat", texte: "Le chat n'est pas impur, c'est une des bêtes qui tournent autour de vous.", source: "At-Tirmidhi" },
    { sujet: "Heure", texte: "L'Heure ne viendra pas tant que le soleil ne se lèvera pas de l'Occident.", source: "Bukhari & Muslim" },
    { sujet: "Dajjal", texte: "Il n'y a pas, entre la création d'Adam et l'Heure, de créature plus grande que le Dajjal.", source: "Muslim" },
    { sujet: "Cœur", texte: "Les cœurs s'apaisent par l'évocation d'Allah.", source: "Coran 13:28" },
    { sujet: "Destin", texte: "Tout est écrit.", source: "Muslim" },
    { sujet: "Bonheur", texte: "Le bonheur, tout le bonheur, est dans l'obéissance à Allah.", source: "Ibn Qayyim" },
    { sujet: "Tristesse", texte: "Ne sois pas triste, Allah est avec nous.", source: "Coran 9:40" },
    { sujet: "Peur", texte: "C'est Satan qui vous fait peur de ses alliés.", source: "Coran 3:175" },
    { sujet: "Espoir", texte: "Ne désespérez pas de la miséricorde d'Allah.", source: "Coran 39:53" },
    { sujet: "Pardon", texte: "Allah pardonne tous les péchés.", source: "Coran 39:53" },
    { sujet: "Injustice", texte: "Ne pensez pas qu'Allah soit inattentif à ce que font les injustes.", source: "Coran 14:42" },
    { sujet: "Patience", texte: "Endure ! Ton endurance n'est qu'avec l'aide d'Allah.", source: "Coran 16:127" },
    { sujet: "Remerciement", texte: "Si vous êtes reconnaissants, J'augmenterai (Mes bienfaits).", source: "Coran 14:7" },
    { sujet: "Invocation", texte: "Invoquez-Moi, Je vous exaucerai.", source: "Coran 40:60" },
    { sujet: "Proche", texte: "Je suis proche. Je réponds à l'appel de celui qui M'appelle.", source: "Coran 2:186" },
    { sujet: "Aide", texte: "C'est Toi seul que nous adorons, et c'est Toi seul dont nous implorons secours.", source: "Coran 1:5" },
    { sujet: "Protection", texte: "Je cherche protection auprès du Seigneur de l'aube naissante.", source: "Coran 113:1" },
    { sujet: "Gens", texte: "Je cherche protection auprès du Seigneur des hommes.", source: "Coran 114:1" },
    { sujet: "Unicité", texte: "Dis : Il est Allah, Unique.", source: "Coran 112:1" },
    { sujet: "Trône", texte: "Son Trône déborde les cieux et la terre.", source: "Coran 2:255" },
    { sujet: "Lumière", texte: "Allah est la Lumière des cieux et de la terre.", source: "Coran 24:35" },
    { sujet: "Création", texte: "N'ont-ils pas vu comment Allah commence la création puis la recommence ?", source: "Coran 29:19" },
    { sujet: "Vie", texte: "La vie présente n'est que jeu et amusement.", source: "Coran 47:36" },
    { sujet: "Au-delà", texte: "La demeure de l'Au-delà est assurément la vraie vie.", source: "Coran 29:64" },
    { sujet: "Bien", texte: "Le bien et le mal ne sont pas pareils.", source: "Coran 41:34" },
    { sujet: "Mal", texte: "Repousse le mal par ce qui est meilleur.", source: "Coran 23:96" },
    { sujet: "Paix", texte: "Entrez-y en paix et en sécurité.", source: "Coran 15:46" },
    { sujet: "Salutation", texte: "Leur salutation, le jour où ils Le rencontreront, sera : Salam.", source: "Coran 33:44" },
    { sujet: "Jardins", texte: "Aux croyants et croyantes, Allah a promis des Jardins.", source: "Coran 9:72" },
    { sujet: "Vue", texte: "Les regards ne peuvent L'atteindre.", source: "Coran 6:103" },
    { sujet: "Ouïe", texte: "Il est l'Audient, le Clairvoyant.", source: "Coran 42:11" },
    { sujet: "Savoir", texte: "Et au-dessus de tout homme détenant la science il y a un savant (plus docte).", source: "Coran 12:76" },
    { sujet: "Âme", texte: "Chaque âme goûtera la mort.", source: "Coran 3:185" },
    { sujet: "Retour", texte: "C'est vers Nous que vous serez ramenés.", source: "Coran 21:35" },
    { sujet: "Jugement", texte: "Ce jour-là, pas d'injustice.", source: "Coran 40:17" },
    { sujet: "Balance", texte: "Ceux dont la balance est lourde seront les bienheureux.", source: "Coran 23:102" },
  // --- PACK 5 : 100 HADITHS (LUMIÈRE & GUIDÉE) ---
    { sujet: "Patience", texte: "La patience est une lumière.", source: "Muslim" },
    { sujet: "Pureté", texte: "La pureté est la moitié de la foi.", source: "Muslim" },
    { sujet: "Coran", texte: "Le Coran est une preuve pour toi ou contre toi.", source: "Muslim" },
    { sujet: "Aumône", texte: "L'aumône est une preuve (de la foi).", source: "Muslim" },
    { sujet: "Dhikr", texte: "La meilleure formule d'évocation est : La ilaha illallah.", source: "At-Tirmidhi" },
    { sujet: "Doua", texte: "La meilleure invocation est : Alhamdulillah.", source: "At-Tirmidhi" },
    { sujet: "Salutation", texte: "Ô gens ! Répandez le salut, donnez à manger et priez la nuit.", source: "At-Tirmidhi" },
    { sujet: "Amour", texte: "Aime pour les gens ce que tu aimes pour toi-même, tu seras croyant.", source: "At-Tirmidhi" },
    { sujet: "Voisin", texte: "Sois bon envers ton voisin, tu seras musulman.", source: "At-Tirmidhi" },
    { sujet: "Rire", texte: "Ne multiplie pas le rire, car l'excès de rire tue le cœur.", source: "At-Tirmidhi" },
    { sujet: "Interdit", texte: "Le licite est clair et l'illicite est clair.", source: "Bukhari & Muslim" },
    { sujet: "Cœur", texte: "La piété est ici (en montrant sa poitrine trois fois).", source: "Muslim" },
    { sujet: "Frère", texte: "Il suffit à l'homme pour être mauvais de mépriser son frère musulman.", source: "Muslim" },
    { sujet: "Secours", texte: "Allah vient au secours du serviteur tant que le serviteur vient au secours de son frère.", source: "Muslim" },
    { sujet: "Science", texte: "Celui qui emprunte un chemin vers la science, Allah lui facilite un chemin vers le Paradis.", source: "Muslim" },
    { sujet: "Groupe", texte: "Le loup ne mange que la brebis égarée.", source: "Abu Dawud" },
    { sujet: "Modestie", texte: "Personne ne se montre modeste pour Allah sans qu'Allah ne l'élève.", source: "Muslim" },
    { sujet: "Richesse", texte: "La richesse n'est pas l'abondance des biens, mais la richesse est celle de l'âme.", source: "Bukhari & Muslim" },
    { sujet: "Force", texte: "Le fort n'est pas celui qui est fort en lutte, mais celui qui se maîtrise sous la colère.", source: "Bukhari & Muslim" },
    { sujet: "Dettes", texte: "Le martyr est pardonné de tout, sauf de la dette.", source: "Muslim" },
    { sujet: "Bien", texte: "Celui qui instaure dans l'Islam une bonne tradition en a la récompense.", source: "Muslim" },
    { sujet: "Mal", texte: "Celui qui instaure une mauvaise tradition en porte le fardeau.", source: "Muslim" },
    { sujet: "Voyage", texte: "Le voyage est un fragment du châtiment.", source: "Bukhari & Muslim" },
    { sujet: "Prière", texte: "La prière en groupe dépasse la prière individuelle de 27 degrés.", source: "Bukhari & Muslim" },
    { sujet: "Mosquée", texte: "Celui qui va à la mosquée matin ou soir, Allah lui prépare une demeure au Paradis.", source: "Bukhari & Muslim" },
    { sujet: "Vendredi", texte: "Qui fait les ablutions majeures le vendredi, c'est comme s'il avait offert un chameau.", source: "Bukhari & Muslim" },
    { sujet: "Imam", texte: "L'Imam est un garant et le muezzin est un dépositaire.", source: "Abu Dawud" },
    { sujet: "Rang", texte: "Le meilleur rang pour les hommes est le premier, et le pire est le dernier.", source: "Muslim" },
    { sujet: "Aube", texte: "Les deux raka'at de l'aube sont meilleures que le monde et ce qu'il contient.", source: "Muslim" },
    { sujet: "Nuit", texte: "Le Seigneur descend chaque nuit au ciel le plus bas.", source: "Bukhari & Muslim" },
    { sujet: "Witr", texte: "Allah est Impair et aime ce qui est impair.", source: "Bukhari & Muslim" },
    { sujet: "Jeûne", texte: "Le jeûne est un bouclier.", source: "Bukhari & Muslim" },
    { sujet: "Ramadan", texte: "Qui jeûne le Ramadan avec foi et espérance, ses péchés passés sont pardonnés.", source: "Bukhari & Muslim" },
    { sujet: "LaylatulQadr", texte: "Cherchez la Nuit du Destin dans les dix dernières nuits impaires.", source: "Bukhari" },
    { sujet: "Hajj", texte: "Prenez de moi vos rituels.", source: "Muslim" },
    { sujet: "Omra", texte: "Une Omra efface les péchés commis depuis la précédente.", source: "Bukhari & Muslim" },
    { sujet: "Jihad", texte: "Le meilleur Jihad est une parole de vérité auprès d'un gouverneur injuste.", source: "Abu Dawud" },
    { sujet: "Martyr", texte: "Le Paradis est sous l'ombre des épées.", source: "Bukhari" },
    { sujet: "Cheval", texte: "Le bien est attaché au toupet des chevaux jusqu'au Jour de la Résurrection.", source: "Bukhari & Muslim" },
    { sujet: "Flèche", texte: "La force, c'est le tir.", source: "Muslim" },
    { sujet: "Gouverneur", texte: "Obéissez à celui qui détient l'autorité parmi vous.", source: "Coran 4:59" },
    { sujet: "Obéissance", texte: "Pas d'obéissance à une créature dans la désobéissance au Créateur.", source: "Ahmed" },
    { sujet: "Conseil", texte: "La religion c'est le bon conseil.", source: "Muslim" },
    { sujet: "Serment", texte: "Celui qui jure par autre qu'Allah a commis du Shirk (association).", source: "Abu Dawud" },
    { sujet: "Vœu", texte: "Ne faites pas de vœux, car le vœu ne change rien au destin.", source: "Bukhari & Muslim" },
    { sujet: "Juge", texte: "Les juges sont de trois types : un au Paradis et deux en Enfer.", source: "Abu Dawud" },
    { sujet: "Témoignage", texte: "Le faux témoignage équivaut à l'association à Allah.", source: "Abu Dawud" },
    { sujet: "Héritage", texte: "Allah a donné à chaque ayant-droit son droit, pas de testament pour un héritier.", source: "Abu Dawud" },
    { sujet: "Mariage", texte: "Ô jeunes gens ! Celui qui en a la capacité, qu'il se marie.", source: "Bukhari & Muslim" },
    { sujet: "Femme", texte: "On épouse une femme pour quatre raisons : ses biens, sa lignée, sa beauté et sa religion.", source: "Bukhari & Muslim" },
    { sujet: "Divorce", texte: "La chose licite la plus détestée d'Allah est le divorce.", source: "Abu Dawud" },
    { sujet: "Allaitement", texte: "L'allaitement interdit ce que la parenté interdit.", source: "Bukhari & Muslim" },
    { sujet: "Dépense", texte: "Le dinar que tu dépenses pour ta famille est celui qui a la plus grande récompense.", source: "Muslim" },
    { sujet: "Mère", texte: "Qui mérite le plus ma bonne compagnie ? Ta mère, puis ta mère, puis ta mère, puis ton père.", source: "Bukhari & Muslim" },
    { sujet: "Esclave", texte: "Ce sont vos frères, Allah les a placés sous votre autorité.", source: "Bukhari & Muslim" },
    { sujet: "Vêtement", texte: "Mangez, buvez, habillez-vous et donnez l'aumône, sans gaspillage ni orgueil.", source: "Bukhari" },
    { sujet: "Or", texte: "L'or et la soie sont interdits aux hommes de ma communauté.", source: "At-Tirmidhi" },
    { sujet: "Image", texte: "Ceux qui seront le plus châtiés le Jour de la Résurrection sont les faiseurs d'images.", source: "Bukhari & Muslim" },
    { sujet: "Chien", texte: "Si le chien lèche votre récipient, lavez-le sept fois, dont la première avec de la terre.", source: "Muslim" },
    { sujet: "Chaussure", texte: "Que nul de vous ne marche avec une seule chaussure.", source: "Bukhari & Muslim" },
    { sujet: "Dormir", texte: "Ne dors pas sur le ventre.", source: "Abu Dawud" },
    { sujet: "Rêve", texte: "Le bon rêve vient d'Allah et le mauvais rêve vient du Diable.", source: "Bukhari & Muslim" },
    { sujet: "Salam", texte: "Le droit du musulman sur le musulman sont cinq : rendre le Salam...", source: "Bukhari & Muslim" },
    { sujet: "Éternuement", texte: "Si l'un de vous éternue et loue Allah, répondez-lui.", source: "Bukhari" },
    { sujet: "Malade", texte: "Visitez le malade, nourrissez l'affamé, libérez le prisonnier.", source: "Bukhari" },
    { sujet: "Médecine", texte: "La graine de nigelle est un remède contre tout mal sauf la mort.", source: "Bukhari & Muslim" },
    { sujet: "Miel", texte: "La guérison est dans trois choses : la gorgée de miel...", source: "Bukhari" },
    { sujet: "Peste", texte: "Si vous entendez qu'elle est dans une terre, n'y entrez pas.", source: "Bukhari & Muslim" },
    { sujet: "Sorcier", texte: "Celui qui va voir un voyant, sa prière n'est pas acceptée pendant 40 jours.", source: "Muslim" },
    { sujet: "Voyage", texte: "Le voyageur est l'émir de lui-même.", source: "Sagesse" },
    { sujet: "Retour", texte: "Lorsque l'un de vous a terminé son affaire en voyage, qu'il se hâte de rentrer.", source: "Bukhari & Muslim" },
    { sujet: "Langue", texte: "La plupart des péchés du fils d'Adam viennent de sa langue.", source: "At-Tabarani" },
    { sujet: "Silence", texte: "Celui qui se tait a triomphé.", source: "Ahmed" },
    { sujet: "Colère", texte: "La colère vient du Diable.", source: "Abu Dawud" },
    { sujet: "Honte", texte: "La pudeur est tout le bien.", source: "Muslim" },
    { sujet: "Orgueil", texte: "N'entrera pas au Paradis quiconque a un atome d'orgueil dans le cœur.", source: "Muslim" },
    { sujet: "Injustice", texte: "Craignez l'injustice, car c'est des ténèbres le Jour de la Résurrection.", source: "Muslim" },
    { sujet: "Hypocrite", texte: "Les signes de l'hypocrite sont trois.", source: "Bukhari & Muslim" },
    { sujet: "Paradis", texte: "Dans le Paradis, il y a cent degrés.", source: "Bukhari" },
    { sujet: "Enfer", texte: "Le feu que vous allumez est une des 70 parties du feu de l'Enfer.", source: "Bukhari & Muslim" },
    { sujet: "Pont", texte: "Le Sirat est jeté au-dessus de l'Enfer.", source: "Bukhari & Muslim" },
    { sujet: "Bassin", texte: "Mon Bassin a la distance d'un mois de marche.", source: "Bukhari & Muslim" },
    { sujet: "Intercession", texte: "Mon intercession est pour ceux de ma communauté qui ont commis des grands péchés.", source: "At-Tirmidhi" },
    { sujet: "Mort", texte: "La tombe est la première demeure de l'Au-delà.", source: "At-Tirmidhi" },
    { sujet: "Âme", texte: "L'âme du croyant est un oiseau qui se nourrit aux arbres du Paradis.", source: "An-Nasa'i" },
    { sujet: "Heure", texte: "L'Heure ne viendra pas avant que l'Euphrate ne découvre une montagne d'or.", source: "Bukhari & Muslim" },
    { sujet: "Temps", texte: "L'Heure ne viendra pas avant que le temps ne se contracte.", source: "Bukhari" },
    { sujet: "Savoir", texte: "L'Heure ne viendra pas avant que la science ne soit retirée.", source: "Bukhari" },
    { sujet: "Femmes", texte: "Il y aura des femmes habillées mais nues.", source: "Muslim" },
    { sujet: "Constantinople", texte: "Vous conquérez Constantinople.", source: "Ahmed" },
    { sujet: "Dajjal", texte: "Il est borgne et votre Seigneur n'est pas borgne.", source: "Bukhari & Muslim" },
    { sujet: "Jésus", texte: "Le fils de Marie descendra parmi vous comme un juge équitable.", source: "Bukhari & Muslim" },
    { sujet: "Gog", texte: "Ils (Gog et Magog) se précipiteront de chaque hauteur.", source: "Coran 21:96" },
    { sujet: "Soleil", texte: "L'Heure ne viendra pas tant que le soleil ne se lèvera pas de son couchant.", source: "Bukhari & Muslim" },
    { sujet: "Repentir", texte: "Le repentir est accepté tant que le soleil ne se lève pas de l'ouest.", source: "Muslim" },
    { sujet: "Âme", texte: "Le repentir est accepté tant que l'âme n'atteint pas la gorge (râle de la mort).", source: "At-Tirmidhi" },
  // --- PACK 4 : VERS LES 300 (VIE QUOTIDIENNE & SAGESSE) ---
    { sujet: "Conseil", texte: "La religion, c'est le bon conseil.", source: "Muslim" },
    { sujet: "Bien", texte: "Celui à qui Allah veut du bien, Il l'éprouve.", source: "Bukhari" },
    { sujet: "Regard", texte: "Détourne ton regard de ce qui est interdit.", source: "Muslim" },
    { sujet: "Foi", texte: "La foi comporte soixante-dix et quelques branches, la meilleure est 'La ilaha illallah'.", source: "Muslim" },
    { sujet: "Péché", texte: "Le repentant d'un péché est comme celui qui n'a pas de péché.", source: "Ibn Majah" },
    { sujet: "Don", texte: "La main du dessus (qui donne) est meilleure que la main du dessous (qui reçoit).", source: "Bukhari" },
    { sujet: "Manger", texte: "Ne mangez pas avec la main gauche, car Satan mange avec la main gauche.", source: "Muslim" },
    { sujet: "Boire", texte: "Ne buvez pas d'un seul trait comme le chameau, mais buvez en deux ou trois fois.", source: "At-Tirmidhi" },
    { sujet: "Chaussures", texte: "Si l'un de vous met ses chaussures, qu'il commence par la droite.", source: "Bukhari & Muslim" },
    { sujet: "Vêtement", texte: "Celui qui porte un vêtement de célébrité ici-bas, Allah l'humiliera le Jour de la Résurrection.", source: "Ahmed" },
    { sujet: "Cheveux", texte: "Celui qui a des cheveux, qu'il en prenne soin.", source: "Abu Dawud" },
    { sujet: "Siwak", texte: "Si je ne craignais de surcharger ma communauté, je leur aurais ordonné le Siwak à chaque prière.", source: "Bukhari" },
    { sujet: "Bâillement", texte: "Le bâillement vient du Diable. Si l'un de vous bâille, qu'il le retienne autant qu'il peut.", source: "Bukhari & Muslim" },
    { sujet: "Éternuement", texte: "Allah aime l'éternuement et déteste le bâillement.", source: "Bukhari" },
    { sujet: "Chien", texte: "Celui qui garde un chien, sauf pour la chasse ou le troupeau, perd une partie de sa récompense chaque jour.", source: "Bukhari" },
    { sujet: "Maison", texte: "Les anges n'entrent pas dans une maison où il y a un chien ou une image.", source: "Bukhari & Muslim" },
    { sujet: "Dette", texte: "Le plus grand péché après les grands péchés est de mourir avec une dette non payée.", source: "Abu Dawud" },
    { sujet: "Interdit", texte: "Tout ce qui enivre est interdit.", source: "Bukhari & Muslim" },
    { sujet: "Colère", texte: "Le juge ne doit pas juger entre deux personnes alors qu'il est en colère.", source: "Bukhari & Muslim" },
    { sujet: "Cadeau", texte: "Rendez le cadeau par un autre cadeau ; si vous ne trouvez pas, invoquez pour la personne.", source: "Abu Dawud" },
    { sujet: "Hospitalité", texte: "L'hospitalité est de trois jours, ce qui est au-delà est une aumône.", source: "Bukhari & Muslim" },
    { sujet: "Voyage", texte: "Le voyageur qui meurt en route est compté comme martyr.", source: "Ibn Majah" },
    { sujet: "Malade", texte: "Nourrissez l'affamé, visitez le malade et libérez le prisonnier.", source: "Bukhari" },
    { sujet: "Mort", texte: "La mort est le cadeau du croyant (car elle le mène à Allah).", source: "Al-Hakim" },
    { sujet: "Tombe", texte: "Visitez les tombes, car elles rappellent l'Au-delà.", source: "Muslim" },
    { sujet: "Funérailles", texte: "Hâtez-vous lors du convoi funèbre.", source: "Bukhari & Muslim" },
    { sujet: "Pleurs", texte: "Le mort souffre des lamentations excessive de sa famille.", source: "Bukhari & Muslim" },
    { sujet: "Fièvre", texte: "La fièvre vient de l'émanation de l'Enfer, refroidissez-la avec de l'eau.", source: "Bukhari & Muslim" },
    { sujet: "Remède", texte: "Allah n'a pas descendu de maladie sans descendre son remède.", source: "Bukhari" },
    { sujet: "Mauvais œil", texte: "Le mauvais œil est une vérité.", source: "Bukhari & Muslim" },
    { sujet: "Sorcellerie", texte: "Évitez les sept périls mortels... dont la sorcellerie.", source: "Bukhari & Muslim" },
    { sujet: "Augure", texte: "Ne croyez pas aux oiseaux de mauvais augure (superstition).", source: "Bukhari" },
    { sujet: "Pluie", texte: "Lorsqu'il pleut, dites : Ô Allah, une pluie utile.", source: "Bukhari" },
    { sujet: "Vent", texte: "N'insultez pas le vent, car il vient de l'ordre d'Allah.", source: "Ahmed" },
    { sujet: "Éclipse", texte: "Le soleil et la lune sont deux signes d'Allah, ils ne s'éclipsent pour la mort de personne.", source: "Bukhari & Muslim" },
    { sujet: "Coq", texte: "Si vous entendez le chant du coq, demandez la grâce d'Allah car il a vu un ange.", source: "Bukhari & Muslim" },
    { sujet: "Âne", texte: "Si vous entendez le braiment de l'âne, cherchez refuge auprès d'Allah contre le Diable.", source: "Bukhari & Muslim" },
    { sujet: "Nuit", texte: "Fermez les portes et éteignez les lumières la nuit avant de dormir.", source: "Bukhari" },
    { sujet: "Feu", texte: "Ne laissez pas le feu allumé dans vos maisons quand vous dormez.", source: "Bukhari & Muslim" },
    { sujet: "Mosquée", texte: "Si l'un de vous entre à la mosquée, qu'il ne s'assoie pas avant de prier deux unités.", source: "Bukhari & Muslim" },
    { sujet: "Vendredi", texte: "Le lavage (Ghusl) du vendredi est obligatoire pour tout pubère.", source: "Bukhari & Muslim" },
    { sujet: "Savoir", texte: "Celui qui cache un savoir utile sera bridé par un frein de feu le Jour de la Résurrection.", source: "Abu Dawud" },
    { sujet: "Coran", texte: "Celui qui n'a rien du Coran dans son cœur est comme une maison en ruine.", source: "At-Tirmidhi" },
    { sujet: "Sourate", texte: "La sourate Al-Mulk (La Royauté) protège du châtiment de la tombe.", source: "At-Tirmidhi" },
    { sujet: "Verset", texte: "Le verset du Trône (Ayat al-Kursi) est le plus grand verset du Livre d'Allah.", source: "Muslim" },
    { sujet: "Fatiha", texte: "Il n'y a pas de prière pour celui qui ne récite pas la Fatiha.", source: "Bukhari & Muslim" },
    { sujet: "Amin", texte: "Si l'Imam dit 'Amin', dites 'Amin'.", source: "Bukhari & Muslim" },
    { sujet: "Rang", texte: "Alignez vos rangs, car l'alignement des rangs fait partie de la perfection de la prière.", source: "Bukhari & Muslim" },
    { sujet: "Imam", texte: "L'Imam a été institué pour être suivi, ne le devancez pas.", source: "Bukhari & Muslim" },
    { sujet: "Prosternation", texte: "Le moment où le serviteur est le plus proche de son Seigneur est lorsqu'il est prosterné.", source: "Muslim" },
    { sujet: "Fajr", texte: "Les deux unités de prière de l'aube valent mieux que le monde entier.", source: "Muslim" },
    { sujet: "Witr", texte: "Allah est Impair (Unique) et Il aime l'impair.", source: "Bukhari & Muslim" },
    { sujet: "Nuit", texte: "La meilleure prière après l'obligatoire est la prière de la nuit.", source: "Muslim" },
    { sujet: "Duha", texte: "Chaque articulation de votre corps doit une aumône chaque jour... deux unités de Duha suffisent.", source: "Muslim" },
    { sujet: "Datte", texte: "Celui qui commence sa journée par sept dattes Ajwa ne sera touché ni par poison ni par sorcellerie.", source: "Bukhari" },
    { sujet: "Prière", texte: "Priez sur moi, car votre prière sur moi est une purification pour vous.", source: "Ibn Hibban" },
    { sujet: "Vendredi", texte: "Multipliez les prières sur moi le jour du vendredi.", source: "Abu Dawud" },
    { sujet: "Noms", texte: "Certes Allah a 99 noms, celui qui les retient entrera au Paradis.", source: "Bukhari & Muslim" },
    { sujet: "Invocation", texte: "Il n'y a rien de plus noble auprès d'Allah que l'invocation.", source: "At-Tirmidhi" },
    { sujet: "Adhan", texte: "L'invocation n'est pas rejetée entre l'Adhan et l'Iqama.", source: "At-Tirmidhi" },
    { sujet: "Patience", texte: "Celui qui s'efforce de patienter, Allah lui donnera la patience.", source: "Bukhari" },
    { sujet: "Force", texte: "Le croyant fort est meilleur que le croyant faible, mais en tous deux il y a du bien.", source: "Muslim" },
    { sujet: "Groupe", texte: "La main d'Allah est avec le groupe.", source: "At-Tirmidhi" },
    { sujet: "Division", texte: "Et ne vous divisez pas.", source: "Coran 3:103" },
    { sujet: "Étranger", texte: "L'Islam a commencé étrange et redeviendra étrange, bienheureux soient les étrangers.", source: "Muslim" },
    { sujet: "Monde", texte: "Ce monde est la prison du croyant et le paradis du mécréant.", source: "Muslim" },
    { sujet: "Paradis", texte: "Au Paradis, il y a ce qu'aucun œil n'a vu, aucune oreille n'a entendu.", source: "Bukhari & Muslim" },
    { sujet: "Rivière", texte: "Al-Kawthar est une rivière que mon Seigneur m'a promise au Paradis.", source: "Bukhari" },
    { sujet: "Portes", texte: "Le Paradis possède huit portes.", source: "Bukhari" },
    { sujet: "Rayyan", texte: "Il y a une porte au Paradis appelée Ar-Rayyan, réservée aux jeûneurs.", source: "Bukhari & Muslim" },
    { sujet: "Dernier", texte: "Le dernier à entrer au Paradis aura dix fois l'équivalent de ce monde.", source: "Bukhari & Muslim" },
    { sujet: "Vision", texte: "Vous verrez votre Seigneur comme vous voyez la pleine lune.", source: "Bukhari & Muslim" },
    { sujet: "Miséricorde", texte: "Ma miséricorde l'emporte sur Ma colère.", source: "Bukhari & Muslim" },
    { sujet: "Pardon", texte: "Ô fils d'Adam, tant que tu M'invoques et espères en Moi, Je te pardonne.", source: "At-Tirmidhi" },
    { sujet: "Amour", texte: "Si Allah aime un serviteur, Il appelle Gabriel et lui dit : J'aime un tel, aime-le.", source: "Bukhari & Muslim" },
    { sujet: "Opinion", texte: "Je suis selon l'opinion que Mon serviteur a de Moi.", source: "Bukhari & Muslim" },
    { sujet: "Approche", texte: "S'il s'approche de Moi d'un empan, Je M'approche de lui d'une coudée.", source: "Bukhari & Muslim" },
    { sujet: "Course", texte: "S'il vient à Moi en marchant, Je viens à lui en courant (avec empressement).", source: "Bukhari & Muslim" },
    { sujet: "Épreuve", texte: "La grandeur de la récompense est liée à la grandeur de l'épreuve.", source: "At-Tirmidhi" },
    { sujet: "Larmes", texte: "Deux yeux ne seront pas touchés par le Feu : un œil qui a pleuré par crainte d'Allah...", source: "At-Tirmidhi" },
    { sujet: "Ombre", texte: "Sept personnes seront sous l'ombre d'Allah le jour où il n'y aura d'autre ombre que la Sienne.", source: "Bukhari & Muslim" },
    { sujet: "Jeunesse", texte: "(Parmi les 7) : Un jeune qui a grandi dans l'adoration d'Allah.", source: "Bukhari & Muslim" },
    { sujet: "Cœur", texte: "(Parmi les 7) : Un homme dont le cœur est attaché aux mosquées.", source: "Bukhari & Muslim" },
    { sujet: "Discrétion", texte: "(Parmi les 7) : Un homme qui a donné l'aumône si discrètement que sa main gauche ignore ce que sa droite a donné.", source: "Bukhari & Muslim" },
    { sujet: "Tentazione", texte: "(Parmi les 7) : Un homme invité par une femme noble et belle, qui a dit : Je crains Allah.", source: "Bukhari & Muslim" },
    { sujet: "Fraternité", texte: "(Parmi les 7) : Deux hommes qui se sont aimés en Allah, réunis et séparés pour Lui.", source: "Bukhari & Muslim" },
    { sujet: "Isolement", texte: "(Parmi les 7) : Un homme qui a mentionné Allah seul et ses yeux ont pleuré.", source: "Bukhari & Muslim" },
    { sujet: "Justice", texte: "(Parmi les 7) : Un dirigeant juste.", source: "Bukhari & Muslim" },
    { sujet: "Fin", texte: "Les actes ne valent que par leur fin (leur conclusion).", source: "Bukhari" },
  // --- PACK 6 : 100 HADITHS (COMPORTEMENT & CROYANCE) ---
    { sujet: "Mensonge", texte: "Le mensonge mène à la perversité, et la perversité mène à l'Enfer.", source: "Bukhari & Muslim" },
    { sujet: "Sincérité", texte: "La religion c'est la sincérité (envers Allah, Son Livre, Son Messager).", source: "Muslim" },
    { sujet: "Pudeur", texte: "Chaque religion a une moralité, et la moralité de l'Islam est la pudeur.", source: "Ibn Majah" },
    { sujet: "Douceur", texte: "Celui qui est privé de douceur est privé de tout bien.", source: "Muslim" },
    { sujet: "Colère", texte: "L'homme fort n'est pas celui qui se bat bien, mais celui qui se maîtrise sous la colère.", source: "Bukhari" },
    { sujet: "Oppression", texte: "Craignez l'injustice, car l'injustice sera des ténèbres le Jour de la Résurrection.", source: "Muslim" },
    { sujet: "Jalousie", texte: "La jalousie mange les bonnes actions comme le feu mange le bois.", source: "Abu Dawud" },
    { sujet: "Orgueil", texte: "Quiconque a le poids d'un atome d'orgueil dans son cœur n'entrera pas au Paradis.", source: "Muslim" },
    { sujet: "Médisance", texte: "Ne vous espionnez pas et ne dites pas de mal les uns des autres.", source: "Bukhari & Muslim" },
    { sujet: "Haine", texte: "Ne vous haïssez pas, ne vous jalousez pas, et soyez des frères.", source: "Bukhari & Muslim" },
    { sujet: "Salutation", texte: "Répandez la paix (Salam) entre vous, vous vous aimerez.", source: "Muslim" },
    { sujet: "Cadeau", texte: "Faites-vous des cadeaux, cela dissipera la haine.", source: "At-Tirmidhi" },
    { sujet: "Voisin", texte: "Jibril n'a cessé de me recommander le voisin jusqu'à ce que je croie qu'il allait en faire un héritier.", source: "Bukhari & Muslim" },
    { sujet: "Invité", texte: "Celui qui croit en Allah et au Jour Dernier, qu'il honore son invité.", source: "Bukhari & Muslim" },
    { sujet: "Parents", texte: "Le paradis est aux pieds des mères.", source: "An-Nasa'i" },
    { sujet: "Père", texte: "Le père est la porte centrale du Paradis.", source: "At-Tirmidhi" },
    { sujet: "Famille", texte: "Le meilleur d'entre vous est le meilleur envers sa famille.", source: "At-Tirmidhi" },
    { sujet: "Lien", texte: "Celui qui rompt les liens de parenté n'entrera pas au Paradis.", source: "Bukhari & Muslim" },
    { sujet: "Orphelin", texte: "Moi et le tuteur de l'orphelin sommes au Paradis comme ces deux doigts.", source: "Bukhari" },
    { sujet: "Veuve", texte: "Celui qui aide la veuve et le pauvre est comme le combattant dans le sentier d'Allah.", source: "Bukhari & Muslim" },
    { sujet: "Malade", texte: "Visitez le malade, nourrissez l'affamé et libérez le captif.", source: "Bukhari" },
    { sujet: "Miséricorde", texte: "Faites miséricorde à ceux qui sont sur terre, Celui qui est au ciel vous fera miséricorde.", source: "At-Tirmidhi" },
    { sujet: "Animal", texte: "Craignez Allah concernant ces animaux qui ne parlent pas.", source: "Abu Dawud" },
    { sujet: "Chat", texte: "Une femme est entrée en Enfer à cause d'une chatte qu'elle a enfermée.", source: "Bukhari & Muslim" },
    { sujet: "Chien", texte: "Un homme a vu un chien assoiffé, il lui a donné à boire, Allah lui a pardonné.", source: "Bukhari & Muslim" },
    { sujet: "Chemin", texte: "Écarter une gêne du chemin est une aumône.", source: "Bukhari & Muslim" },
    { sujet: "Sourire", texte: "Ton sourire face à ton frère est une aumône.", source: "At-Tirmidhi" },
    { sujet: "Parole", texte: "Une bonne parole est une aumône.", source: "Bukhari & Muslim" },
    { sujet: "Silence", texte: "Que celui qui croit en Allah dise du bien ou se taise.", source: "Bukhari & Muslim" },
    { sujet: "Promesse", texte: "Le respect de l'engagement fait partie de la foi.", source: "Bukhari" },
    { sujet: "Dette", texte: "L'âme du croyant est suspendue à sa dette jusqu'à ce qu'elle soit payée.", source: "At-Tirmidhi" },
    { sujet: "Usure", texte: "Allah a maudit celui qui mange l'usure (Riba), celui qui la fait manger, celui qui l'écrit.", source: "Muslim" },
    { sujet: "Commerce", texte: "Le vendeur et l'acheteur ont le choix tant qu'ils ne se sont pas séparés.", source: "Bukhari & Muslim" },
    { sujet: "Serment", texte: "Le serment écoule la marchandise mais efface la bénédiction.", source: "Bukhari & Muslim" },
    { sujet: "Travail", texte: "Nul n'a mangé de meilleure nourriture que celle acquise par le travail de ses mains.", source: "Bukhari" },
    { sujet: "Manger", texte: "Prononce le nom d'Allah, mange de la main droite et mange ce qui est devant toi.", source: "Bukhari & Muslim" },
    { sujet: "Boire", texte: "Ne buvez pas debout.", source: "Muslim" },
    { sujet: "Vêtement", texte: "Mangez, buvez, habillez-vous sans excès ni orgueil.", source: "An-Nasa'i" },
    { sujet: "Or", texte: "L'or et la soie sont interdits aux hommes de ma communauté.", source: "At-Tirmidhi" },
    { sujet: "Image", texte: "Les anges n'entrent pas dans une maison où il y a une image ou un chien.", source: "Bukhari & Muslim" },
    { sujet: "Sommeil", texte: "Dors sur ton flanc droit.", source: "Bukhari & Muslim" },
    { sujet: "Réveil", texte: "Louange à Allah qui nous a rendu la vie après nous avoir fait mourir.", source: "Bukhari" },
    { sujet: "Rêve", texte: "Le bon rêve vient d'Allah, le mauvais vient du Diable.", source: "Bukhari & Muslim" },
    { sujet: "Prière", texte: "La prière est la première chose sur laquelle le serviteur sera jugé.", source: "At-Tirmidhi" },
    { sujet: "Ablution", texte: "La pureté est la moitié de la foi.", source: "Muslim" },
    { sujet: "Siwak", texte: "Le Siwak purifie la bouche et satisfait le Seigneur.", source: "Bukhari" },
    { sujet: "Mosquée", texte: "Les lieux les plus aimés d'Allah sont les mosquées.", source: "Muslim" },
    { sujet: "Vendredi", texte: "Le meilleur jour sur lequel le soleil s'est levé est le vendredi.", source: "Muslim" },
    { sujet: "Adhan", texte: "L'invocation n'est pas rejetée entre l'Adhan et l'Iqama.", source: "At-Tirmidhi" },
    { sujet: "Coran", texte: "Le meilleur d'entre vous est celui qui apprend le Coran et l'enseigne.", source: "Bukhari" },
    { sujet: "Sourate", texte: "La sourate Al-Mulk protège du châtiment de la tombe.", source: "At-Tirmidhi" },
    { sujet: "Verset", texte: "Ayat al-Kursi est le plus grand verset du Livre d'Allah.", source: "Muslim" },
    { sujet: "Jeûne", texte: "Le jeûne est un bouclier.", source: "Bukhari & Muslim" },
    { sujet: "Ramadan", texte: "À l'arrivée du Ramadan, les portes du Paradis sont ouvertes.", source: "Bukhari & Muslim" },
    { sujet: "Nuit", texte: "Cherchez la Nuit du Destin dans les dix dernières nuits impaires.", source: "Bukhari" },
    { sujet: "Aumône", texte: "L'aumône ne diminue en rien la richesse.", source: "Muslim" },
    { sujet: "Cachette", texte: "Sept personnes seront sous l'ombre d'Allah... dont un homme qui donne l'aumône en secret.", source: "Bukhari & Muslim" },
    { sujet: "Hajj", texte: "Le Hajj accepté n'a d'autre récompense que le Paradis.", source: "Bukhari & Muslim" },
    { sujet: "Omra", texte: "La Omra expie les péchés commis depuis la précédente.", source: "Bukhari & Muslim" },
    { sujet: "Jihad", texte: "Le meilleur Jihad est une parole de vérité face à un gouverneur injuste.", source: "Abu Dawud" },
    { sujet: "Martyr", texte: "Celui qui meurt pour défendre ses biens est un martyr.", source: "Bukhari & Muslim" },
    { sujet: "Intention", texte: "Les actes ne valent que par les intentions.", source: "Bukhari & Muslim" },
    { sujet: "Innovation", texte: "Toute innovation (religieuse) est un égarement.", source: "Muslim" },
    { sujet: "Suivi", texte: "Accrochez-vous à ma Sunna.", source: "Abu Dawud" },
    { sujet: "Savoir", texte: "La recherche de la science est une obligation pour tout musulman.", source: "Ibn Majah" },
    { sujet: "Savant", texte: "Les savants sont les héritiers des prophètes.", source: "Abu Dawud" },
    { sujet: "Ignorance", texte: "Allah ne reprend pas la science en l'arrachant, mais en faisant mourir les savants.", source: "Bukhari & Muslim" },
    { sujet: "Mort", texte: "Rappelez-vous souvent la destructrice des plaisirs (la mort).", source: "At-Tirmidhi" },
    { sujet: "Tombe", texte: "La tombe est la première demeure de l'Au-delà.", source: "At-Tirmidhi" },
    { sujet: "Funérailles", texte: "Suivez les convois funèbres, cela rappelle l'Au-delà.", source: "Muslim" },
    { sujet: "Fin", texte: "Chacun sera ressuscité dans l'état où il est mort.", source: "Muslim" },
    { sujet: "Jugement", texte: "Le pied du serviteur ne bougera pas avant d'être interrogé sur quatre choses.", source: "At-Tirmidhi" },
    { sujet: "Balance", texte: "Deux paroles sont légères sur la langue, lourdes dans la balance : SubhanAllah wa bihamdihi, SubhanAllah al-Azim.", source: "Bukhari & Muslim" },
    { sujet: "Enfer", texte: "Protégez-vous du Feu, ne serait-ce qu'avec une moitié de datte.", source: "Bukhari & Muslim" },
    { sujet: "Pont", texte: "Le Sirat est plus fin qu'un cheveu et plus tranchant qu'une épée.", source: "Muslim" },
    { sujet: "Bassin", texte: "Mon Bassin est grand comme un mois de marche.", source: "Bukhari & Muslim" },
    { sujet: "Paradis", texte: "Il y a au Paradis ce qu'aucun œil n'a vu, aucune oreille n'a entendu.", source: "Bukhari & Muslim" },
    { sujet: "Vision", texte: "Vous verrez votre Seigneur comme vous voyez la lune.", source: "Bukhari & Muslim" },
    { sujet: "Dernier", texte: "Le dernier à sortir de l'Enfer aura dix fois ce monde.", source: "Bukhari & Muslim" },
    { sujet: "Miséricorde", texte: "Ma miséricorde l'emporte sur Ma colère.", source: "Bukhari & Muslim" },
    { sujet: "Pardon", texte: "Ô fils d'Adam ! Si tu viens à Moi avec des péchés plein la terre mais sans rien M'associer, Je viendrai avec autant de pardon.", source: "At-Tirmidhi" },
    { sujet: "Invocation", texte: "Invoquez-Moi, Je vous exaucerai.", source: "Coran 40:60" },
    { sujet: "Proche", texte: "Je suis proche, Je réponds à l'appel de celui qui M'appelle.", source: "Coran 2:186" },
    { sujet: "Noms", texte: "Allah a 99 noms, celui qui les retient entre au Paradis.", source: "Bukhari & Muslim" },
    { sujet: "Doua", texte: "La meilleure invocation est : Alhamdulillah.", source: "At-Tirmidhi" },
    { sujet: "Patience", texte: "La patience est une lumière.", source: "Muslim" },
    { sujet: "Destin", texte: "Sache que ce qui t'a manqué ne devait pas t'atteindre.", source: "Abu Dawud" },
    { sujet: "Confiance", texte: "Si vous placiez votre confiance en Allah comme il se doit, Il vous nourrirait comme les oiseaux.", source: "At-Tirmidhi" },
    { sujet: "Maladie", texte: "Aucun mal ne touche le musulman sans qu'Allah n'efface par cela ses péchés.", source: "Bukhari & Muslim" },
    { sujet: "Remède", texte: "Soignez-vous, car Allah n'a pas créé de maladie sans créer son remède.", source: "Abu Dawud" },
    { sujet: "Miel", texte: "La guérison est dans le miel.", source: "Bukhari" },
    { sujet: "Graine", texte: "La graine de nigelle est une guérison pour tout mal sauf la mort.", source: "Bukhari & Muslim" },
  // --- PACK 7 : LE CAP DES 500 (FOI & PRATIQUE) ---
    { sujet: "Changement", texte: "Celui d'entre vous qui voit un mal, qu'il le change par sa main.", source: "Muslim" },
    { sujet: "Bien", texte: "Celui qui appelle à un bien aura la récompense de celui qui le fait.", source: "Muslim" },
    { sujet: "Mosquée", texte: "Attendez la prière après la prière, c'est cela le Ribat (la garde en sentier d'Allah).", source: "Muslim" },
    { sujet: "Purification", texte: "La prière de l'un de vous n'est pas acceptée s'il a rompu ses ablutions jusqu'à ce qu'il les refasse.", source: "Bukhari" },
    { sujet: "Eau", texte: "Ne gaspille pas l'eau, même si tu es au bord d'une rivière courante.", source: "Ibn Majah" },
    { sujet: "Droite", texte: "Le Prophète aimait commencer par la droite en se chaussant, en se coiffant et en se purifiant.", source: "Bukhari & Muslim" },
    { sujet: "Siwak", texte: "Le Siwak est une purification pour la bouche et une satisfaction pour le Seigneur.", source: "Ahmed" },
    { sujet: "Ail", texte: "Celui qui a mangé de l'ail ou de l'oignon, qu'il s'éloigne de notre mosquée.", source: "Bukhari & Muslim" },
    { sujet: "Vendredi", texte: "Il y a une heure le vendredi où Allah exauce les invocations.", source: "Bukhari & Muslim" },
    { sujet: "Khutba", texte: "Si tu dis à ton voisin 'Tais-toi' pendant que l'Imam fait le sermon, tu as commis une futilité.", source: "Bukhari & Muslim" },
    { sujet: "Prière", texte: "La clé du Paradis est la prière.", source: "At-Tirmidhi" },
    { sujet: "Ablutions", texte: "La clé de la prière est la purification.", source: "Abu Dawud" },
    { sujet: "Soujoud", texte: "Il n'est pas permis au musulman de se prosterner devant son frère.", source: "Ibn Majah" },
    { sujet: "Retard", texte: "Des gens ne cesseront de se mettre en retard (pour la prière) jusqu'à ce qu'Allah les mette en retard.", source: "Muslim" },
    { sujet: "Imam", texte: "L'Imam a été désigné pour être suivi.", source: "Bukhari" },
    { sujet: "Voyageur", texte: "La prière du voyageur est de deux raka'at.", source: "Bukhari & Muslim" },
    { sujet: "Malade", texte: "Prie debout ; si tu ne peux pas, assis ; si tu ne peux pas, sur le côté.", source: "Bukhari" },
    { sujet: "Oubli", texte: "Si l'un de vous oublie une prière, qu'il la prie dès qu'il s'en souvient.", source: "Bukhari & Muslim" },
    { sujet: "Zakat", texte: "L'Islam est bâti sur cinq piliers... (dont) l'acquittement de la Zakat.", source: "Bukhari & Muslim" },
    { sujet: "Or", texte: "Il n'y a pas de Zakat sur les bijoux (portés par les femmes selon certains avis, mais divergent).", source: "Divergence" },
    { sujet: "Aumône", texte: "L'aumône efface les péchés comme l'eau éteint le feu.", source: "At-Tirmidhi" },
    { sujet: "Famille", texte: "Commence par ceux dont tu as la charge (pour l'aumône).", source: "Bukhari & Muslim" },
    { sujet: "Jeûne", texte: "Celui qui ne renonce pas au mensonge, Allah n'a pas besoin qu'il renonce à sa nourriture.", source: "Bukhari" },
    { sujet: "Lune", texte: "Jeûnez à sa vision (la lune) et rompez à sa vision.", source: "Bukhari & Muslim" },
    { sujet: "Suhoor", texte: "Prenez le repas du Suhoor, car il y a une bénédiction dans le Suhoor.", source: "Bukhari & Muslim" },
    { sujet: "Rupture", texte: "Les gens ne cesseront d'être dans le bien tant qu'ils hâteront la rupture du jeûne.", source: "Bukhari & Muslim" },
    { sujet: "Datte", texte: "Si l'un de vous rompt le jeûne, qu'il le rompe avec des dattes.", source: "Abu Dawud" },
    { sujet: "Oubli", texte: "Celui qui mange ou boit par oubli (en jeûnant), qu'il continue son jeûne, c'est Allah qui l'a nourri.", source: "Bukhari & Muslim" },
    { sujet: "Hajj", texte: "Le Hajj, c'est Arafat.", source: "At-Tirmidhi" },
    { sujet: "Talbiya", texte: "Labbayk Allahumma Labbayk.", source: "Tradition" },
    { sujet: "Pierre Noire", texte: "La Pierre Noire est descendue du Paradis, plus blanche que le lait, mais les péchés des hommes l'ont noircie.", source: "At-Tirmidhi" },
    { sujet: "Zamzam", texte: "L'eau de Zamzam sert à ce pour quoi elle est bue.", source: "Ibn Majah" },
    { sujet: "Jihad", texte: "Le Paradis est sous l'ombre des épées.", source: "Bukhari" },
    { sujet: "Martyr", texte: "On pardonne au martyr dès la première goutte de son sang.", source: "Ahmed" },
    { sujet: "Frontière", texte: "Monter la garde un jour et une nuit vaut mieux que le jeûne d'un mois.", source: "Muslim" },
    { sujet: "Intention", texte: "Celui qui combat pour que la parole d'Allah soit la plus haute est dans le sentier d'Allah.", source: "Bukhari & Muslim" },
    { sujet: "Cheval", texte: "Le bien est noué au toupet des chevaux jusqu'au Jour de la Résurrection.", source: "Bukhari & Muslim" },
    { sujet: "Vente", texte: "Le serment écoule la marchandise mais anéantit le gain.", source: "Bukhari" },
    { sujet: "Défaut", texte: "Il n'est pas permis de vendre une marchandise comportant un défaut sans l'indiquer.", source: "Ibn Majah" },
    { sujet: "Tromperie", texte: "Celui qui nous trompe n'est pas des nôtres.", source: "Muslim" },
    { sujet: "Usure", texte: "Évitez les sept péchés destructeurs... (dont) manger l'usure.", source: "Bukhari & Muslim" },
    { sujet: "Orphelin", texte: "Ceux qui mangent injustement les biens des orphelins ne font que manger du feu.", source: "Coran 4:10" },
    { sujet: "Héritage", texte: "Apprenez les lois de l'héritage et enseignez-les.", source: "At-Tirmidhi" },
    { sujet: "Mariage", texte: "La femme est épousée pour quatre choses...", source: "Bukhari & Muslim" },
    { sujet: "Dot", texte: "La meilleure dot est la plus facile.", source: "Abu Dawud" },
    { sujet: "Femme", texte: "Le monde est jouissance, et la meilleure jouissance est la femme pieuse.", source: "Muslim" },
    { sujet: "Mari", texte: "Si la femme prie ses cinq prières... et obéit à son mari, elle entrera au Paradis.", source: "Ahmed" },
    { sujet: "Équité", texte: "Craignez Allah et soyez équitables envers vos enfants.", source: "Bukhari & Muslim" },
    { sujet: "Divorce", texte: "Le licite le plus détesté d'Allah est le divorce.", source: "Abu Dawud" },
    { sujet: "Nourriture", texte: "Ô jeune homme, dis Bismillah, mange de la main droite et mange ce qui est devant toi.", source: "Bukhari" },
    { sujet: "Manger", texte: "Je ne mange pas accoudé.", source: "Bukhari" },
    { sujet: "Boire", texte: "Ne buvez pas dans des récipients en or ou en argent.", source: "Bukhari & Muslim" },
    { sujet: "Invité", texte: "Celui qui croit en Allah et au Jour Dernier, qu'il honore son invité.", source: "Bukhari" },
    { sujet: "Vêtement", texte: "Allah est Beau et Il aime la beauté.", source: "Muslim" },
    { sujet: "Soie", texte: "Porter de la soie est interdit aux hommes de ma communauté.", source: "Bukhari" },
    { sujet: "Blanc", texte: "Portez des vêtements blancs, ce sont vos meilleurs vêtements.", source: "Abu Dawud" },
    { sujet: "Chaussure", texte: "Si la lanière de la sandale de l'un de vous casse, qu'il ne marche pas avec une seule.", source: "Muslim" },
    { sujet: "Image", texte: "Les anges n'entrent pas dans une maison où il y a une image.", source: "Bukhari" },
    { sujet: "Maladie", texte: "Le mauvais œil est une vérité.", source: "Bukhari & Muslim" },
    { sujet: "Visite", texte: "Visitez le malade.", source: "Bukhari" },
    { sujet: "Remède", texte: "Il y a dans la graine noire un remède contre tout mal sauf la mort.", source: "Bukhari" },
    { sujet: "Miel", texte: "La guérison se trouve dans trois choses : l'entaille de la ventouse, la gorgée de miel...", source: "Bukhari" },
    { sujet: "Sorcellerie", texte: "Celui qui fait un nœud et souffle dessus a pratiqué la sorcellerie.", source: "An-Nasa'i" },
    { sujet: "Voyance", texte: "Celui qui va voir un voyant... sa prière n'est pas acceptée 40 jours.", source: "Muslim" },
    { sujet: "Présage", texte: "Le mauvais présage est du polythéisme (Shirk).", source: "Abu Dawud" },
    { sujet: "Langue", texte: "La foi du serviteur ne sera droite que si son cœur est droit, et son cœur ne sera droit que si sa langue est droite.", source: "Ahmed" },
    { sujet: "Mensonge", texte: "Prenez garde au mensonge.", source: "Muslim" },
    { sujet: "Maudire", texte: "Le croyant n'est pas quelqu'un qui maudit.", source: "At-Tirmidhi" },
    { sujet: "Promesse", texte: "Malheur à celui qui parle et ment pour faire rire les gens.", source: "Abu Dawud" },
    { sujet: "Silence", texte: "Celui qui se tait est sauvé.", source: "At-Tirmidhi" },
    { sujet: "Colère", texte: "La colère vient du Diable.", source: "Abu Dawud" },
    { sujet: "Honte", texte: "La pudeur n'apporte que du bien.", source: "Bukhari & Muslim" },
    { sujet: "Cœur", texte: "La douceur n'est pas dans une chose sans l'embellir.", source: "Muslim" },
    { sujet: "Patience", texte: "La patience est une lumière.", source: "Muslim" },
    { sujet: "Pardon", texte: "Allah ne fait qu'augmenter la puissance du serviteur qui pardonne.", source: "Muslim" },
    { sujet: "Orgueil", texte: "N'entre pas au Paradis celui qui a un atome d'orgueil.", source: "Muslim" },
    { sujet: "Hypocrisie", texte: "Les signes de l'hypocrite sont trois.", source: "Bukhari & Muslim" },
    { sujet: "Paradis", texte: "Le Paradis est entouré de désagréments.", source: "Muslim" },
    { sujet: "Enfer", texte: "L'Enfer est entouré de désirs.", source: "Bukhari & Muslim" },
    { sujet: "Vision", texte: "Vous verrez votre Seigneur.", source: "Bukhari" },
    { sujet: "Dernier", texte: "Le dernier homme à entrer au Paradis...", source: "Muslim" },
    { sujet: "Châtiment", texte: "Le châtiment le plus léger en Enfer...", source: "Muslim" },
    { sujet: "Ombre", texte: "Sept personnes seront sous l'ombre d'Allah...", source: "Bukhari & Muslim" },
    { sujet: "Jugement", texte: "Le premier cas jugé entre les hommes sera celui du sang (crimes).", source: "Bukhari & Muslim" },
    { sujet: "Bassin", texte: "Mon Bassin est plus blanc que le lait.", source: "Bukhari & Muslim" },
    { sujet: "Sirat", texte: "Le pont jeté sur l'Enfer.", source: "Bukhari" },
    { sujet: "Intercession", texte: "J'ai gardé mon invocation comme intercession pour ma communauté.", source: "Bukhari & Muslim" },
    { sujet: "Mort", texte: "La tombe est la première étape de l'Au-delà.", source: "At-Tirmidhi" },
    { sujet: "Âme", texte: "L'âme du croyant transpire (au moment de la mort).", source: "At-Tirmidhi" },
    { sujet: "Heure", texte: "L'Heure ne viendra pas tant que le soleil ne se lèvera pas de l'ouest.", source: "Bukhari & Muslim" },
    { sujet: "Science", texte: "Allah ne reprend pas la science en l'arrachant aux poitrines.", source: "Bukhari" },
    { sujet: "Temps", texte: "Le temps se contractera.", source: "Bukhari" },
    { sujet: "Richesse", texte: "L'argent surabondera.", source: "Bukhari" },
    { sujet: "Dajjal", texte: "Il est borgne de l'œil droit.", source: "Bukhari" },
    { sujet: "Jésus", texte: "Issa fils de Maryam descendra.", source: "Bukhari" },
    { sujet: "Gog", texte: "Ils sortiront de partout.", source: "Coran" },
    { sujet: "Bête", texte: "La Bête sortira et parlera aux gens.", source: "Coran" },
    { sujet: "Repentir", texte: "Le repentir est accepté tant que le soleil ne se lève pas de l'ouest.", source: "Muslim" },
  ];
/* =========================================
   PARTIE 2 : LE MOTEUR DU SITE (LOGIQUE)
   Ne touche pas à ça, c'est le cerveau !
   ========================================= */

const itemsPerPage = 10;
let currentPage = 1;
let currentSourceFilter = "Tous";

const container = document.getElementById('hadithListContainer');
const searchInput = document.getElementById('searchInput');
const topicFilter = document.getElementById('topicFilter');

// Création pagination
let paginationContainer = document.getElementById('pagination-controls');
if (!paginationContainer) {
    paginationContainer = document.createElement('div');
    paginationContainer.id = 'pagination-controls';
    paginationContainer.style.textAlign = 'center';
    paginationContainer.style.padding = '20px 0 50px 0';
    container.parentNode.appendChild(paginationContainer);
}

// Navigation écrans
function showScreen(screenId) {
    document.querySelectorAll('.screen').forEach(s => {
        s.classList.remove('active');
        s.classList.remove('fade-in'); 
    });
    const screen = document.getElementById(screenId);
    screen.classList.add('active');
    void screen.offsetWidth; 
    screen.classList.add('fade-in');
}

function goToMenu() { showScreen('screen-menu'); }

function goToList(sourceKey) {
    currentSourceFilter = sourceKey;
    const titleElement = document.getElementById('list-title');
    if(sourceKey === 'Tous') titleElement.innerText = "Tout le recueil";
    else if(sourceKey === 'Autre') titleElement.innerText = "Sources Diverses";
    else titleElement.innerText = "Sahih " + sourceKey;
    
    searchInput.value = "";
    topicFilter.value = "Tous";
    currentPage = 1; 
    
    showScreen('screen-list');
    filterHadiths(); 
}

// Affichage
function displayHadiths(items) {
    container.innerHTML = "";
    
    const totalItems = items.length;
    const totalPages = Math.ceil(totalItems / itemsPerPage);
    
    if (currentPage < 1) currentPage = 1;
    if (currentPage > totalPages && totalPages > 0) currentPage = totalPages;

    const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const paginatedItems = items.slice(start, end);

    if(items.length === 0) {
        container.innerHTML = "<div style='text-align:center; padding:50px; color:#aaa;'>Aucun hadith trouvé.</div>";
        paginationContainer.innerHTML = "";
        return;
    }

    paginatedItems.forEach(hadith => {
        const card = document.createElement('div');
        card.className = 'hadith-card';
        card.innerHTML = `
            <span class="tag">${hadith.sujet}</span>
            <div class="hadith-text">« ${hadith.texte} »</div>
            <div class="hadith-source">— ${hadith.source}</div>
        `;
        container.appendChild(card);
    });

    renderPagination(totalPages);
}

function renderPagination(totalPages) {
    paginationContainer.innerHTML = "";
    if (totalPages <= 1) return;

    const prevBtn = document.createElement('button');
    prevBtn.innerText = "← Précédent";
    prevBtn.onclick = () => { if(currentPage > 1) { currentPage--; filterHadiths(); document.getElementById('screen-list').scrollTop = 0; }};
    prevBtn.style.marginRight = "10px";
    prevBtn.style.padding = "10px 20px";
    prevBtn.style.borderRadius = "20px";
    prevBtn.style.border = "1px solid #ccc";
    prevBtn.style.background = currentPage === 1 ? "#eee" : "white";
    prevBtn.style.color = currentPage === 1 ? "#aaa" : "#333";
    prevBtn.disabled = currentPage === 1;

    const nextBtn = document.createElement('button');
    nextBtn.innerText = "Suivant →";
    nextBtn.onclick = () => { if(currentPage < totalPages) { currentPage++; filterHadiths(); document.getElementById('screen-list').scrollTop = 0; }};
    nextBtn.style.marginLeft = "10px";
    nextBtn.style.padding = "10px 20px";
    nextBtn.style.borderRadius = "20px";
    nextBtn.style.border = "1px solid #ccc";
    nextBtn.style.background = currentPage === totalPages ? "#eee" : "white";
    nextBtn.style.color = currentPage === totalPages ? "#aaa" : "#333";
    nextBtn.disabled = currentPage === totalPages;

    const info = document.createElement('span');
    info.innerText = `${currentPage} / ${totalPages}`;
    info.style.color = "#888";
    info.style.fontWeight = "bold";

    paginationContainer.appendChild(prevBtn);
    paginationContainer.appendChild(info);
    paginationContainer.appendChild(nextBtn);
}

function filterHadiths() {
    const searchTerm = searchInput.value.toLowerCase();
    const selectedTopic = topicFilter.value;

    const filtered = hadiths.filter(hadith => {
        let matchesSourceMenu = true;
        if (currentSourceFilter !== "Tous") {
            if (currentSourceFilter === "Autre") {
                matchesSourceMenu = !hadith.source.includes("Bukhari") && 
                                    !hadith.source.includes("Muslim") && 
                                    !hadith.source.includes("Tirmidhi");
            } else {
                matchesSourceMenu = hadith.source.includes(currentSourceFilter);
            }
        }
        const matchesTopic = selectedTopic === "Tous" || hadith.sujet === selectedTopic;
        const matchesSearch = hadith.texte.toLowerCase().includes(searchTerm) || 
                              hadith.source.toLowerCase().includes(searchTerm);

        return matchesSourceMenu && matchesTopic && matchesSearch;
    });

    displayHadiths(filtered);
}

searchInput.addEventListener('input', () => { currentPage = 1; filterHadiths(); });
topicFilter.addEventListener('change', () => { currentPage = 1; filterHadiths(); });

/* =========================================
   MISE À JOUR AUTOMATIQUE DU COMPTEUR
   ========================================= */
setTimeout(function() {
    // On vérifie si l'élément existe
    const counter = document.getElementById('totalCount');
    
    // Si oui, on remplace le texte par la taille de la liste
    if (counter && typeof hadiths !== 'undefined') {
        counter.innerText = hadiths.length;
    }
}, 500); // On attend 0.5 seconde pour être sûr
/* =========================================
   ROBOT NETTOYEUR DE DOUBLONS 🤖
   ========================================= */
// 1. On sauvegarde le nombre avant nettoyage
const countBefore = hadiths.length;

// 2. On crée une nouvelle liste sans les copies
const uniqueList = [];
const seenTexts = new Set();

hadiths.forEach(item => {
    // On compare les textes (on retire les espaces inutiles)
    const signature = item.texte.trim().toLowerCase();
    
    // Si on n'a jamais vu ce texte, on l'ajoute
    if (!seenTexts.has(signature)) {
        seenTexts.add(signature);
        uniqueList.push(item);
    }
});

// 3. On remplace l'ancienne liste par la propre
hadiths = uniqueList;

// 4. On met à jour le compteur affiché
const countAfter = hadiths.length;
console.log("Nettoyage terminé : " + (countBefore - countAfter) + " doublons supprimés.");

// Mise à jour du texte en bas de page
setTimeout(function() {
    const counter = document.getElementById('totalCount');
    if (counter) counter.innerText = hadiths.length;
}, 500);
/* =========================================
   MOTEUR DU QUIZ ÉDUCATIF 🧠
   ========================================= */

// 1. La base de données des questions
const quizData = [
    {
        question: "Selon le Hadith, où se trouve le Paradis ?",
        options: ["Dans le ciel", "Sous les pieds des mères", "À l'est", "Dans les mosquées"],
        correct: 1 // L'index de la bonne réponse (0, 1, 2, 3)
    },
    {
        question: "Quelle action est décrite comme une 'aumône' facile ?",
        options: ["Donner de l'or", "Jeûner un an", "Sourire à son frère", "Construire une maison"],
        correct: 2
    },
    {
        question: "Quel est le pilier de l'Islam qui efface les péchés comme l'eau éteint le feu ?",
        options: ["La Zakat (Aumône)", "Le Hajj", "La Prière", "Le Jeûne"],
        correct: 0
    },
    {
        question: "Complétez : 'Le fort n'est pas celui qui terrasse ses adversaires, mais celui qui...'",
        options: ["...porte des montagnes", "...se maîtrise lors de la colère", "...prie toute la nuit", "...parle fort"],
        correct: 1
    },
    {
        question: "Quel verset est le plus grand du Coran selon les Hadiths ?",
        options: ["Al-Fatiha", "Al-Ikhlas", "Ayat al-Kursi", "Al-Falaq"],
        correct: 2
    },
  // --- PACK QUESTIONS 1 ---
    {
        question: "Combien y a-t-il de piliers en Islam ?",
        options: ["3", "5", "6", "99"],
        correct: 1
    },
    {
        question: "Quelle est la première sourate révélée au Prophète (sws) ?",
        options: ["Al-Fatiha", "Al-Baqara", "Al-Alaq (Iqra)", "An-Nas"],
        correct: 2
    },
    {
        question: "Quel prophète a été avalé par un grand poisson ?",
        options: ["Moussa (Moïse)", "Younous (Jonas)", "Issa (Jésus)", "Youssef (Joseph)"],
        correct: 1
    },
    {
        question: "Quelle prière ne comporte ni inclinaison ni prosternation ?",
        options: ["La prière de l'Aïd", "La prière du Vendredi", "La prière mortuaire (Janaza)", "La prière de l'éclipse"],
        correct: 2
    },
    {
        question: "Quel compagnon a été le premier Calife de l'Islam ?",
        options: ["Omar ibn al-Khattab", "Ali ibn Abi Talib", "Abou Bakr as-Siddiq", "Othman ibn Affan"],
        correct: 2
    },
    {
        question: "Combien de fois par jour un musulman doit-il prier ?",
        options: ["3 fois", "5 fois", "7 fois", "10 fois"],
        correct: 1
    },
    {
        question: "Quel est le livre sacré révélé au prophète Daoud (David) ?",
        options: ["La Thora", "L'Évangile", "Le Zabour (Psaumes)", "Le Coran"],
        correct: 2
    },
    {
        question: "Dans quelle ville le Prophète (sws) est-il né ?",
        options: ["Médine", "Jérusalem", "La Mecque", "Taif"],
        correct: 2
    },
    {
        question: "Quel mois vient juste après le Ramadan ?",
        options: ["Chaabane", "Chawwal", "Mouharram", "Safar"],
        correct: 1
    },
    {
        question: "Quelle est la sourate qui équivaut à un tiers du Coran ?",
        options: ["Al-Fatiha", "Al-Kawthar", "Al-Ikhlas", "Al-Falaq"],
        correct: 2
    },
    {
        question: "Quel ange est chargé de souffler dans la Trompe le Jour du Jugement ?",
        options: ["Jibril", "Mikail", "Israfil", "Malik"],
        correct: 2
    },
    {
        question: "Combien d'années la révélation du Coran a-t-elle duré ?",
        options: ["10 ans", "23 ans", "40 ans", "63 ans"],
        correct: 1
    },
    {
        question: "Quel est le nom de la mère du Prophète (sws) ?",
        options: ["Khadija", "Aicha", "Amina", "Halima"],
        correct: 2
    },
    {
        question: "Quelle est la nuit meilleure que mille mois ?",
        options: ["La nuit de l'Ascension", "La nuit du Destin (Laylatul Qadr)", "La nuit du doute", "La première nuit du Ramadan"],
        correct: 1
    },
    {
        question: "Que doit-on dire avant de commencer à manger ?",
        options: ["Alhamdulillah", "Bismillah", "Allahu Akbar", "Astaghfirullah"],
        correct: 1
    },
    {
        question: "Quel prophète a parlé au berceau ?",
        options: ["Moussa", "Issa (Jésus)", "Yahya", "Ismail"],
        correct: 1
    },
    {
        question: "Quelle est la 'Mère des Croyants' surnommée 'La Pure' (At-Tahira) ?",
        options: ["Aicha", "Hafsa", "Khadija", "Zaynab"],
        correct: 2
    },
    {
        question: "Combien de sourates compte le Coran ?",
        options: ["110", "112", "114", "120"],
        correct: 2
    },
    {
        question: "Quelle prière marque le milieu de la journée ?",
        options: ["Fajr", "Dohr", "Asr", "Maghrib"],
        correct: 1
    },
    {
        question: "Qui a construit la Kaaba avec son fils ?",
        options: ["Adam", "Nouh (Noé)", "Ibrahim (Abraham)", "Moussa"],
        correct: 2
    },
    {
        question: "Quel est le péché qu'Allah ne pardonne pas s'il n'est pas repenti avant la mort ?",
        options: ["Le vol", "Le meurtre", "Le Shirk (Association)", "Le mensonge"],
        correct: 2
    },
    {
        question: "Quelle est la plus courte sourate du Coran ?",
        options: ["Al-Asr", "Al-Kawthar", "An-Nasr", "Al-Ikhlas"],
        correct: 1
    },
    {
        question: "Quel compagnon est surnommé 'Le Lion d'Allah' ?",
        options: ["Khalid ibn Walid", "Hamza ibn Abd al-Muttalib", "Omar ibn al-Khattab", "Ali ibn Abi Talib"],
        correct: 1
    },
    {
        question: "Dans quelle direction les musulmans prient-ils ?",
        options: ["Vers l'Est", "Vers Jérusalem", "Vers la Kaaba (La Mecque)", "Vers le Ciel"],
        correct: 2
    },
    {
        question: "Quel est le nom de la monture du Prophète lors du voyage nocturne ?",
        options: ["Al-Qaswa", "Al-Buraq", "Duldul", "Al-Abwa"],
        correct: 1
    },
    {
        question: "Qui fut le premier muezzin de l'Islam ?",
        options: ["Zayd ibn Thabit", "Bilal al-Habachi", "Abdullah ibn Masud", "Salman al-Farisi"],
        correct: 1
    },
    {
        question: "Quel prophète a fendu la mer en deux par la permission d'Allah ?",
        options: ["Nouh", "Moussa", "Salih", "Chouaib"],
        correct: 1
    },
    {
        question: "Combien y a-t-il de mois sacrés en Islam ?",
        options: ["1", "3", "4", "12"],
        correct: 2
    },
    {
        question: "Quelle femme a une sourate portant son nom dans le Coran ?",
        options: ["Khadija", "Asiya", "Maryam", "Hajar"],
        correct: 2
    },
    {
        question: "Que signifie le mot 'Islam' ?",
        options: ["Paix", "Guerre", "Soumission (à Allah)", "Liberté"],
        correct: 2
    },
  
  
];

// Variables du jeu
let currentQuestionIndex = 0;
let score = 0;
let isAnswering = false; // Pour empêcher de cliquer 2 fois

// Variable pour stocker les 5 questions de la partie en cours
let currentQuizQuestions = [];

window.startQuiz = function() {
    currentQuestionIndex = 0;
    score = 0;
    
    // 1. On mélange toutes les questions disponibles (Algorithme de Fisher-Yates)
    // On crée une copie pour ne pas casser l'ordre original
    let shuffled = [...quizData].sort(() => 0.5 - Math.random());
    
    // 2. On prend seulement les 5 premières du mélange
    currentQuizQuestions = shuffled.slice(0, 5);
    
    // 3. On affiche l'écran
    showScreen('screen-quiz');
    document.getElementById('quiz-content').style.display = 'block';
    document.getElementById('quiz-result').style.display = 'none';
    
    function loadQuestion() {
    isAnswering = false;
    // ATTENTION : On utilise maintenant 'currentQuizQuestions'
    const q = currentQuizQuestions[currentQuestionIndex];
    const total = currentQuizQuestions.length; // Sera toujours 5
    
    // Barre de progression
    const progress = ((currentQuestionIndex) / total) * 100;
    document.getElementById('progress-fill').style.width = progress + "%";
    
    // Affichage
    document.getElementById('question-text').innerText = q.question;
    
    const optionsDiv = document.getElementById('options-container');
    optionsDiv.innerHTML = "";
    
    q.options.forEach((opt, index) => {
        const btn = document.createElement('button');
        btn.className = 'option-btn';
        btn.innerText = opt;
        btn.onclick = () => checkAnswer(index, btn);
        optionsDiv.appendChild(btn);
    });
}

function checkAnswer(selectedIndex, btnElement) {
    if (isAnswering) return;
    isAnswering = true;
    
    // On vérifie dans la liste des 5 questions actuelles
    const correctIndex = currentQuizQuestions[currentQuestionIndex].correct;
    
    if (selectedIndex === correctIndex) {
        btnElement.classList.add('correct');
        score++;
    } else {
        btnElement.classList.add('wrong');
        const allBtns = document.querySelectorAll('.option-btn');
        allBtns[correctIndex].classList.add('correct');
    }
    
    setTimeout(() => {
        currentQuestionIndex++;
        // On vérifie si on a fini les 5 questions
        if (currentQuestionIndex < currentQuizQuestions.length) {
            loadQuestion();
        } else {
            showResults();
        }
    }, 1500);
}

// Charger une question
function loadQuestion() {
    isAnswering = false;
    const q = quizData[currentQuestionIndex];
    const total = quizData.length;
    
    // Mise à jour barre de progression
    const progress = ((currentQuestionIndex) / total) * 100;
    document.getElementById('progress-fill').style.width = progress + "%";
    
    // Affichage texte
    document.getElementById('question-text').innerText = q.question;
    
    // Création des boutons
    const optionsDiv = document.getElementById('options-container');
    optionsDiv.innerHTML = ""; // On vide les anciens boutons
    
    q.options.forEach((opt, index) => {
        const btn = document.createElement('button');
        btn.className = 'option-btn';
        btn.innerText = opt;
        btn.onclick = () => checkAnswer(index, btn);
        optionsDiv.appendChild(btn);
    });
}

function loadQuestion() {
    isAnswering = false;
    // ATTENTION : On utilise maintenant 'currentQuizQuestions'
    const q = currentQuizQuestions[currentQuestionIndex];
    const total = currentQuizQuestions.length; // Sera toujours 5
    
    // Barre de progression
    const progress = ((currentQuestionIndex) / total) * 100;
    document.getElementById('progress-fill').style.width = progress + "%";
    
    // Affichage
    document.getElementById('question-text').innerText = q.question;
    
    const optionsDiv = document.getElementById('options-container');
    optionsDiv.innerHTML = "";
    
    q.options.forEach((opt, index) => {
        const btn = document.createElement('button');
        btn.className = 'option-btn';
        btn.innerText = opt;
        btn.onclick = () => checkAnswer(index, btn);
        optionsDiv.appendChild(btn);
    });
}

function checkAnswer(selectedIndex, btnElement) {
    if (isAnswering) return;
    isAnswering = true;
    
    // On vérifie dans la liste des 5 questions actuelles
    const correctIndex = currentQuizQuestions[currentQuestionIndex].correct;
    
    if (selectedIndex === correctIndex) {
        btnElement.classList.add('correct');
        score++;
    } else {
        btnElement.classList.add('wrong');
        const allBtns = document.querySelectorAll('.option-btn');
        allBtns[correctIndex].classList.add('correct');
    }
    
    setTimeout(() => {
        currentQuestionIndex++;
        // On vérifie si on a fini les 5 questions
        if (currentQuestionIndex < currentQuizQuestions.length) {
            loadQuestion();
        } else {
            showResults();
        }
    }, 1500);
}
    
    // Attendre 1.5 seconde avant la suite
    setTimeout(() => {
        currentQuestionIndex++;
        if (currentQuestionIndex < quizData.length) {
            loadQuestion();
        } else {
            showResults();
        }
    }, 1500);
}

// Écran de fin
function showResults() {
    document.getElementById('quiz-content').style.display = 'none';
    const resultDiv = document.getElementById('quiz-result');
    resultDiv.style.display = 'block';
    
    // Animation du score
    document.getElementById('score-number').innerText = score;
    
    const msg = document.getElementById('score-message');
    if (score === 5) msg.innerText = "Incroyable ! Un vrai savant 🏆";
    else if (score >= 3) msg.innerText = "Bravo ! Belle connaissance 👏";
    else msg.innerText = "Courage ! Relis les Hadiths et réessaie 💪";
}
/* =========================================
   GÉNÉRATEUR HADITH DU JOUR 🌞
   ========================================= */
setTimeout(function() {
    if (typeof hadiths !== 'undefined' && hadiths.length > 0) {
        // On utilise la date d'aujourd'hui pour choisir un numéro
        const today = new Date();
        // Astuce mathématique pour avoir un chiffre unique par jour
        const dateIndex = today.getFullYear() * 1000 + (today.getMonth() + 1) * 30 + today.getDate();
        
        // On prend ce chiffre modulo le nombre total de hadiths
        // Ça nous donne un hadith différent chaque jour, qui tourne en boucle
        const dailyIndex = dateIndex % hadiths.length;
        const dailyHadith = hadiths[dailyIndex];

        // On l'affiche
        document.getElementById('daily-hadith-text').innerText = "« " + dailyHadith.texte + " »";
        document.getElementById('daily-hadith-source').innerText = "— " + dailyHadith.source;
    }
}, 500);
        
    </script>
</body>
</html>
