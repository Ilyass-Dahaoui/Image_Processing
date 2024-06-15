function [H] = linear_filter(type, M, N, cutoff, n)

    H = lpfilter(type,M,N,cutoff,n);
    
    h = ifft2(H);

    figure; subplot(211); mesh(fftshift(H));
    title("Domaine fréquentiel")

    subplot(212); mesh(fftshift(h));
    title("Réponse impulsionnelle")

    sgtitle("Filtre (passe-bas)" + type)

end