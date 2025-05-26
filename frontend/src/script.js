document.getElementById('submit').addEventListener('click', async () => {
    const question = document.getElementById('question').value.trim();
    if (!question) return;
  
    try {
      const res = await fetch('/api/chat', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ question }),
      });
  
      const data = await res.json();
  
      document.getElementById('results').classList.remove('hidden');
      document.getElementById('sql').textContent = data.sql || 'No SQL returned.';
      document.getElementById('output').textContent = JSON.stringify(data.rows, null, 2);
    } catch (err) {
      alert('Error contacting server. Check console.');
      console.error(err);
    }
  });
  