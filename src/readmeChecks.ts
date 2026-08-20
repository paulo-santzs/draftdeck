export type ReadmeCheck = { name: string; ok: boolean }

export function checkReadme(text: string): ReadmeCheck[] {
  return [
    { name: 'Descrição', ok: /^.{0,20}\n\n.+/m.test(text) },
    { name: 'Recursos', ok: /## Recursos/i.test(text) },
    { name: 'Como executar', ok: /## (Executar|Instalação)/i.test(text) },
    { name: 'Limitações', ok: /## Limitações/i.test(text) },
  ]
}

export function readmeScore(text: string): number {
  const checks = checkReadme(text)
  const base = checks.filter((check) => check.ok).length * 20
  const bonus = Math.min(20, Math.floor(text.trim().split(/\s+/).filter(Boolean).length / 20))
  return Math.min(100, base + bonus)
}
