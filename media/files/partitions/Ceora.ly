\version "2.23.10"
#(set-global-staff-size 18)

\include "jazzchords.ily"
\include "lilyjazz.ily"
\include "poly-mark-engraver223.ly"
\include "BookPartPagesJAS223.ly"
\include "MRB223.ly"
% \include "twoCompoundMetersJAS223.ly"
% \include "staffColor.ly"
%\include "Bass_changes_equal_root223.ly"
%\include "enHarmoniszeChordsName.ly"

title = #"Ceora"
composer = #"Lee Morgan"
meter = #"(Med. Bossa)"
kwtempo = #"Medium"
kwstyle = #"Bossa"
global = { \key as \major \time 4/4 }

\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##t
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
  system-system-spacing = #'((basic-distance . 18)
                             (minimum-distance . 12)
                             (padding . 0))
}

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}
%
% \layout {
%   \context {
%     \Score
%     dalSegnoTextFormatter = #(lambda (context return-count marks)
%                                #{ \markup { \with-color #red \fontsize #2 "D.C. al Coda"  } #})
%       }
% }


\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Lee Morgan" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=ECw3WAX41OA"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

message = \markup ""

Ossature = {
  \mark \default
  s1*4 \break
  s1*4 \break
  s1*4 \break
  s1*4 \break \bar "||" \mark \default
  s1*4 \break
  s1*4 \break
  s1*4 \break
  s1*2
  \polyMark #'ru \markup \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" }
  s1*2
  \break
  \polyMark #'rde \markup { "Solos then" \with-color #red "D.C. al Coda" }
  \polyMark #'lu \markup \with-color #red \musicglyph "scripts.varcoda"

  s1*3
  \bar ".."
}

VoixI =  \relative c' {
  \override TextSpanner.bound-details.left.text = "Break"
  \global
  << { r8 es } \\
     {
       \once \override TextScript.extra-offset = #'( -5.5 . 0 )
       \parenthesize es4 _\markup \center-column { "(played at beg." "of 1st Solo)" } } >> d'8 es r es, r es'16 d | des!2. r4 |
  r8 es, b' c r es, r bes'~ | 2. r4
  r8 a, g' as r as, r as' | g2. r8 g16 as |
  es2 r4 r8 c16 es | as4\trill r8 \startTextSpan ges bes\trill a as g \stopTextSpan
  f as r c r des r es16 c | bes2 r4 bes16 as g f  |
  g8 bes r d r es r f16 d | c2 r4 c16 d bes c
  a8 c r e r f e16 d c a | d4 r8 e r d c\trill b |
  c4 r8 f des!\trill f, a c | bes4 r8 des r e16 ges es8 des
  c8-> es, d' es r es, r es' | des!2. r4 |
  r8 es, b' c r es, r bes'~ | 2. r4
  r8 a, g' as r as, r as' | g2. r8 g16 as |
  es2 r4 r8 c16 es | as4\trill r8 \startTextSpan  ges bes\trill a as g \stopTextSpan
  f as r c r des r es16 f | bes,2 r4 bes16 as g f |
  ges2 8\trill f es f | f'4 r8 c \tuplet 3/2 { r f, as } des c
  as2 r8 f as16 bes as8~ | 2 r8 as16 g bes as es f |
  g2  r4 c,16 es g ges | f4 r8 e r e  fis\trill e
  \repeat volta 2 { g2  r4 c,16 es g ges | f4 r8 e r e  fis\trill e }
  \polyMark #'cu "3X"
  <es! g>1 \fermata
}

VoixII =  \relative c'' {
  \global
  % \partial 8
}


accords = \chordmode {
  \set chordChanges = ##f
  \repeat unfold 2 { as1:7+ bes2:m7 es:7  }
  des1:7+ d2:m7 g:7 c1:m7 f4:9+5+ r2.
  bes1:m7 es:7 c:m7 f:7
  d:m7 g:7 c2:m7 f:5+7 bes:m7 es:9-
  \repeat unfold 2 { as1:7+ bes2:m7 es:7  }
  des1:7+ d2:m7 g:7 c1:m7 f4:9+5+ r2.
  bes1:m7 es:7 c:m5-7 f:7
  bes1:m7 es:7 as:7+ bes2:m7 es:7

}

grille = \chordmode {
  %\bar "[|:"
  \mark \default
  \repeat unfold 2 { as1:7+ bes2:m7 es:7  } \break
  des1:7+ d2:m7 g:7 c1:m7 f4:5+9+ r2.\break
  bes1:m7 es:7 c:m7 f:7 \break
  d:m7 g:7 c2:m7 f:5+7 bes:m7 es:9- \break
  \mark \default \bar "||"
  \repeat unfold 2 { as1:7+ bes2:m7 es:7 } \break
  des1:7+ d2:m7 g:7 c1:m7 f4:5+9+ r2. \break
  bes1:m7 es:7 c:m5-7 f:7 \break
  bes1:m7 es:7
  \tweak extra-offset #'(1.5 . -0.8)
  \polyMark #'ru \markup  { \with-color #red { "To Coda" \raise #1 \musicglyph "scripts.varcoda" } }
  as:7+ bes2:m7 es:7
  \polyMark #'rde \markup { \with-color #red "D.C. al Coda" }
  \tweak extra-offset #'(0 . -0.8)
  \polyMark #'cu \markup { \with-color #red \musicglyph "scripts.varcoda" }
  \bar "|." \break
  \repeat volta 2 { as1:7+ bes2:m7 es:7 }
  \once \override Score.RehearsalMark.extra-offset = #'(0 . -0.5)
  \polyMark #'cu "3X" as1:7+ \bar ".."
  \stopStaff s \bar ""
}


%CTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
              %\line { "" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \VoixI
      >>
    } % \message
} }

%Ca4
\book {
  \paper {
    #(set-paper-size "a4")
    % page-count = #1
    print-page-number = ##f
    % print-first-page-number = ##t
    number-pages-per-bookpart = ##t
    print-page-total = ##t
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \accords }
        \new Devnull \Ossature
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #-2 \circle \bold \concat {" " \musicglyph #"clefs.G_change" " "}
              %\line { "" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \VoixI
      >>
    }
  } \bookpart {
    \paper { indent = 0 ragged-right = ##f ragged-last = ##f }
    \new ChordGridScore <<
      \new ChordGrid \grille
    >>
} }

%BbTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "BbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \accords }
        \new Devnull \Ossature
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
              %\line { "" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c d \VoixI
      >>
    } % \message
} }

%Bba4
\book {
  \paper {
    #(set-paper-size "a4")
    % page-count = #1
    print-page-number = ##f
    % print-first-page-number = ##t
    number-pages-per-bookpart = ##t
    print-page-total = ##t
  }
  #(define output-suffix "Bba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \accords }
        \new Devnull \Ossature
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " B \flat " "}
              %\line { "" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c d \VoixI
      >>
    }
  } \bookpart {
    \paper { indent = 0 ragged-right = ##f ragged-last = ##f }
    \new ChordGridScore <<
      \new ChordGrid \transpose c d \grille
    >>
} }

%EbTab
\book {
  \paper {
    #(set-paper-size "a5landscape")
    %page-count = #1
    print-first-page-number = ##t
    number-pages-per-bookpart = ##t %% à décommenter si souhaité
    print-page-total = ##t %% à enlever si non souhaité
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \accords }
        \new Devnull \Ossature
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
              %\line { "" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c a \VoixI
      >>
    } % \message
} }

%Eba4
\book {
  \paper {
    #(set-paper-size "a4")
    % page-count = #1
    print-page-number = ##f
    % print-first-page-number = ##t
    number-pages-per-bookpart = ##t
    print-page-total = ##t
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \accords }
        \new Devnull \Ossature
        \new Staff \with {
          instrumentName = \markup {
            \center-column {
              \pad-around #1 \fontsize #3 \circle \bold \concat {" " E \flat " "}
              %\line { "" }
        } } }
        %\new Voice \with { \consists "Pitch_squash_engraver" }
        \transpose c a \VoixI
      >>
    }
  } \bookpart {
    \paper { indent = 0 ragged-right = ##f ragged-last = ##f }
    \new ChordGridScore <<
      \new ChordGrid \transpose c a \grille
    >>
} }
