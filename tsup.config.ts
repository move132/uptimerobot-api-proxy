import {defineConfig} from 'tsup'

export default defineConfig({
	dts: true,
	clean: true,
	bundle: true,
	// minify: true,
	splitting: false,
	outDir: 'dist',
	format: ['cjs', 'esm'],
	globalName: 'denseLabs',
	entry: ['src/index.ts'],
	noExternal: ['slash']
})
