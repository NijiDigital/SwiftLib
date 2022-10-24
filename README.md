# SwiftLib

## Statut du projet 🚧
Ce projet est actuellement en cours de construction. 

Toute contribution est la bienvenue !

## Description 📖
Contient les extensions Swift couramment utilisées chez Niji.

## Installation ⚙️
<details>
<summary>Swift Package Manager</summary>
</br>
<p>Vous pouvez utiliser <a href="https://swift.org/package-manager">Swift Package Manager</a> pour installer <code>SwiftLib</code> en ajoutant la description suivante à votre fichier <code>Package.swift</code> :</p>

<pre><code class="swift language-swift">import PackageDescription

let package = Package(
    name: "YOUR_PROJECT_NAME",
    targets: [],
    dependencies: [
        .package(url: "https://github.com/NijiDigital/SwiftLib", from: "1.0.0")
    ]
)
</code></pre>

<p>Ensuite, ajoutez <code>SwiftLib</code> à vos targets dependencies :</p>
<pre><code class="swift language-swift">.target(
    name: "YOUR_TARGET_NAME",
    dependencies: [
        "SwiftLib",
    ]
),</code></pre>
<p>Puis lancez la commande <code>swift package update</code>.</p>
</details>

<details>
<summary>CocoaPods</summary>
</br>
<p>Pour intégrer SwiftLib à votre projet Xcode en utilisant <a href="http://cocoapods.org">CocoaPods</a>, renseignez le dans votre <code>Podfile</code> :</p>
<pre><code class="ruby language-ruby">pod 'SwiftLib'</code></pre>
<p>Puis lancez la commande <code>pod install</code>.</p>
</details>

<details>
<summary>Manuellement</summary>
</br>
<p>Ajoutez le dossier <a href="https://github.com/NijiDigital/SwiftLib/tree/main/Sources/SwiftLib">SwiftLib</a> à votre projet Xcode pour utiliser les extensions.</p>
</details>


## Utilisation 🚀
Importez la librairie dans le fichier dans lequel vous voulez avoir accès aux extensions avec 
<pre><code class="swift language-swift">import SwiftLib

...
</code></pre>

Puis utilisez les extensions comme vous le feriez normalement si vous les aviez écrites dans votre fichier courrant.

## Roadmap 📆
 - Peupler la librairie des extensions utiles.
 - Documenter et lister les extensions.

## Comment contribuer 🔨
Tout le monde est invité à contribuer à ce projet en y ajoutant les extensions qui vous paraissent utiles et que vous verriez être utilisées dans d'autres projets chez Niji.

Les contributions se font sur le principe de MR et doivent être approuvées par un pair avant d'être mergées. <br/>
Il n'y a donc pas besoin de fork le projet, vous devriez avoir les droits dessus. Si ce n'est pas le cas, merci de vous tourner vers un admin du projet pour qu'il vous les donne.

Pour tester les modifications de la librairie en direct, remplacez la ligne <code>pod 'SwiftLib'</code> du <code>Podfile</code> de votre projet de test par :
<pre><code class="ruby language-ruby">pod 'SwiftLib', :path => '/Users/yourusername/path/to/pod/repo/SwiftLib'</code></pre>
<p>Puis lancez la commande <code>pod install</code>.</p>
Vous pourrez alors tester les modifications directement sans avoir besoin de push un nouveau tag.

## Auteurs et contributeurs 🖋
Un grand merci aux contributeurs du projet ! ❤️

Liste des contributeurs : 
- Mathieu VIEL
- Nicolas RENAUD

## Licence 📝
SwiftLib est soumis à la licence MIT. Voir la [licence](LICENSE.md) pour plus d'informations.
