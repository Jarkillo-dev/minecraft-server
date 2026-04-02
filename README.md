# Minecraft Paper Server

Paper 1.21.4 server ready for Docker/Easypanel deployment. Configured for AI companion bots (Max, Leche Frita).

## Deploy on Easypanel

1. **Create a new App** in your Easypanel project
2. **Source:** GitHub → `Jarkillo-dev/minecraft-server` → branch `main`
3. **Build:** Dockerfile (auto-detected)
4. **Environment variables:**
   - `MC_RAM` — memory allocation (default: `2G`)
5. **Ports:**
   - `25565` TCP — Minecraft game
   - `25575` TCP — RCON (admin)
6. **Volumes** (persistent storage):
   - `/server/world` — world data
   - `/server/plugins` — plugins (Geyser, etc.)
   - `/server/logs` — server logs
7. **Deploy**

## Configuration

### RCON password

Edit `server.properties` before deploy or change it via Easypanel terminal after first run:

```properties
rcon.password=your-secure-password
```

### Build args

| Arg | Default | Description |
|-----|---------|-------------|
| `PAPER_VERSION` | `1.21.4` | Paper MC version |
| `PAPER_BUILD` | `411` | Paper build number |
| `MC_RAM` | `2G` | JVM heap size |

### Recommended VPS specs

| Bots | Players | RAM | CPU |
|------|---------|-----|-----|
| 1-2  | 1-3     | 2G  | 2 cores |
| 3-5  | 3-5     | 4G  | 4 cores |

## Local development

```bash
docker compose up --build
```

## Connect bots

In the bot's `config.json`, point to your VPS:

```json
{
  "minecraft": {
    "host": "your-vps-ip-or-domain",
    "port": 25565,
    "version": "1.21.4"
  },
  "rcon": {
    "host": "your-vps-ip-or-domain",
    "port": 25575,
    "password": "your-rcon-password"
  }
}
```
