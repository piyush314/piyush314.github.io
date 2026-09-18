// Build a reading guide from the rendered headings, retaining their anchor IDs.
(() => {
  const article = document.querySelector(".research-post #markdown-content");
  const list = document.getElementById("research-sections");
  const guide = document.querySelector(".reading-guide");
  if (!article || !list || !guide) return;

  const sections = [document.getElementById("article-start")];
  const links = [list.querySelector("a")];
  const title = document.querySelector(".post-title").textContent.trim();
  let headings = [...article.querySelectorAll("h2[id]")].filter((heading) => heading.textContent.trim() !== title);
  // Some older articles use h3 for their main sections below a repeated title.
  if (!headings.length) headings = [...article.querySelectorAll("h3[id]")];
  if (!headings.length) {
    guide.closest("aside").hidden = true;
    document.querySelector(".research-layout").classList.add("research-layout--simple");
    return;
  }
  let sectionNumber = 0;
  headings.forEach((heading, index) => {
    const original = heading.textContent;
    const numbered = original.match(/^\s*(\d+)\.\s+/);
    const label = numbered ? original.slice(numbered[0].length).trim() : original.trim();
    sectionNumber = numbered ? Number(numbered[1]) : sectionNumber + 1;

    const number = document.createElement("span");
    number.className = "section-number";
    number.textContent = sectionNumber;
    const title = document.createElement("span");
    title.className = "section-title";
    // Move the original nodes so emphasis, links, and inline math survive.
    let prefixRemaining = numbered ? numbered[0].length : 0;
    const walker = document.createTreeWalker(heading, NodeFilter.SHOW_TEXT);
    while (prefixRemaining > 0 && walker.nextNode()) {
      const node = walker.currentNode;
      const removed = Math.min(prefixRemaining, node.textContent.length);
      node.textContent = node.textContent.slice(removed);
      prefixRemaining -= removed;
    }
    title.append(...heading.childNodes);
    heading.replaceChildren(number, title);
    heading.classList.add("numbered-section");

    // Reuse the opening guide link when the article has an Introduction heading.
    if (index === 0 && /^introduction:?$/i.test(label)) {
      links[0].href = `#${heading.id}`;
      sections[0] = heading;
      return;
    }

    const item = document.createElement("li");
    const link = document.createElement("a");
    link.href = `#${heading.id}`;
    link.textContent = label;
    item.append(link);
    list.append(item);
    sections.push(heading);
    links.push(link);
  });

  const narrow = window.matchMedia("(max-width: 899px)");
  const setGuideMode = () => {
    guide.open = !narrow.matches;
  };
  setGuideMode();
  narrow.addEventListener("change", setGuideMode);
  list.addEventListener("click", (event) => {
    if (narrow.matches && event.target.closest("a")) guide.open = false;
  });

  let scheduled = false;
  const updateCurrent = () => {
    scheduled = false;
    const navbar = document.getElementById("navbar");
    const offset = ((navbar && navbar.getBoundingClientRect().height) || 72) + 80;
    let current = 0;
    sections.forEach((section, index) => {
      if (section.getBoundingClientRect().top <= offset) current = index;
    });
    links.forEach((link, index) => {
      if (index === current) link.setAttribute("aria-current", "location");
      else link.removeAttribute("aria-current");
    });
  };
  const scheduleUpdate = () => {
    if (!scheduled) {
      scheduled = true;
      window.requestAnimationFrame(updateCurrent);
    }
  };
  window.addEventListener("scroll", scheduleUpdate, { passive: true });
  window.addEventListener("resize", scheduleUpdate);
  window.addEventListener("load", scheduleUpdate);
  new ResizeObserver(scheduleUpdate).observe(article);
  updateCurrent();
})();
