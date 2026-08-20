import assert from 'node:assert/strict'
import test from 'node:test'
import { checkReadme, readmeScore } from '../src/readmeChecks.ts'

test('reconhece um README com as seções essenciais', () => {
  const text = '# Projeto\n\nDescrição curta.\n\n## Recursos\n- Um\n\n## Executar\n\n## Limitações\nNenhuma.'
  assert.deepEqual(checkReadme(text).map((check) => check.ok), [true, true, true, true])
  assert.equal(readmeScore(text), 80)
})

test('não aprova um rascunho vazio', () => {
  assert.equal(readmeScore(''), 0)
  assert.equal(checkReadme('')[0]?.ok, false)
})
