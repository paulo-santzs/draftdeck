# DraftDeck
Editor Markdown local-first para preparar READMEs profissionais. Inclui preview, checklist editorial, autosave no navegador e exportação.

**Demo:** [paulo-santzs.github.io/draftdeck](https://paulo-santzs.github.io/draftdeck/)

O DraftDeck atribui uma pontuação editorial de 0 a 100 com base nas seções essenciais e ajuda a revisar o README antes de publicar.

## Acessibilidade

O editor mantém o fluxo principal em teclado, usa rótulos visíveis para as áreas de edição e preview e apresenta a pontuação junto do checklist, sem depender apenas de cor.

```bash
npm install
npm run dev
```

Nenhum texto é enviado para um servidor. O preview cobre intencionalmente apenas um subconjunto de Markdown; um parser completo é o próximo passo. React + TypeScript + Vite. Licença MIT.
